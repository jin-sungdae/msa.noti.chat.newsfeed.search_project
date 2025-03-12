package com.notification.worker.monitoring.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

import com.fasterxml.jackson.databind.deser.std.StringDeserializer;
import com.notification.worker.event.NotificationConsumer;
import com.notification.worker.monitoring.config.TestKafkaConfig;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.admin.*;
import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.ConsumerGroupState;
import org.apache.kafka.common.KafkaFuture;
import org.apache.kafka.common.Node;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.internals.KafkaFutureImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.kafka.config.KafkaListenerContainerFactory;
import org.springframework.kafka.config.KafkaListenerEndpointRegistry;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.listener.MessageListenerContainer;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.ContainerTestUtils;
import org.springframework.kafka.test.utils.KafkaTestUtils;
import org.springframework.test.context.TestPropertySource;

import java.time.Duration;
import java.util.*;
import java.util.concurrent.TimeUnit;


@Slf4j
@SpringBootTest(    properties = {
        "spring.kafka.bootstrap-servers=localhost:9092" // Docker Kafka 사용
})
@Import(TestKafkaConfig.class)
class KafkaMonitoringServiceTest {

    @Mock
    private AdminClient kafkaAdminClient;

    @InjectMocks
    private KafkaMonitoringService kafkaMonitoringService;

    @InjectMocks
    private NotificationConsumer notificationConsumer;

    @Mock
    private RedisTemplate<String, String> redisTemplate;

    @Mock
    private ValueOperations<String, String> valueOperations;

    private static final String MAIN_TOPIC = "notification-topic";
    private static final String DLQ_TOPIC = "notification-dlq";

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;





    @Test
    @DisplayName("consumerLag 정상동작 확인")
    void checkConsumerLag_정상동작() throws Exception {
        // Given
        ConsumerGroupDescription mockGroupDescription = mock(ConsumerGroupDescription.class);
        when(mockGroupDescription.groupId()).thenReturn("notification-group");

        DescribeConsumerGroupsResult mockResult = mock(DescribeConsumerGroupsResult.class);
        when(mockResult.all()).thenReturn(KafkaFuture.completedFuture(Map.of("notification-group", mockGroupDescription)));

        when(kafkaAdminClient.describeConsumerGroups(Collections.singletonList("notification-group")))
                .thenReturn(mockResult);

        // When
        kafkaMonitoringService.checkConsumerLag();

        // Then
        verify(kafkaAdminClient, times(1)).describeConsumerGroups(Collections.singletonList("notification-group"));
    }



    @Test
    @DisplayName("kafka 오류 메시지 redis에 저장 잘 되는지 확인")
    void testCheckConsumerLag_WhenLagExists_ShouldSaveErrorToRedis() {
        MockitoAnnotations.openMocks(this);
        kafkaMonitoringService = new KafkaMonitoringService(kafkaAdminClient, redisTemplate);
        KafkaMonitoringService spyService = spy(kafkaMonitoringService);
        doReturn(20L).when(spyService).getLatestOffset(any(TopicPartition.class));

        kafkaMonitoringService = spyService;

        // RedisTemplate의 ValueOperations Mock 설정
        when(redisTemplate.opsForValue()).thenReturn(valueOperations);

        // ConsumerGroupDescription Mock 설정
        MemberAssignment memberAssignment = mock(MemberAssignment.class);
//        when(memberAssignment.topicPartitions()).thenReturn(Collections.singleton(new TopicPartition("notification-topic", 0)));

        MemberDescription member = new MemberDescription(
                "consumer-1",
                "consumer-instance-1",
                "/192.168.1.10",
                memberAssignment
        );

        ConsumerGroupDescription groupDescription = new ConsumerGroupDescription(
                "notification-group",
                false,
                List.of(member),
                "range",
                ConsumerGroupState.STABLE,
                new Node(1, "kafka-broker-1", 9092)
        );

        Map<String, ConsumerGroupDescription> groupDescriptionMap = new HashMap<>();
        groupDescriptionMap.put("notification-group", groupDescription);

        // KafkaFuture를 직접 생성하고 값을 설정
        KafkaFuture<Map<String, ConsumerGroupDescription>> describeFuture = KafkaFuture.completedFuture(groupDescriptionMap);

        // DescribeConsumerGroupsResult를 Mock으로 설정할 때, all()이 올바른 값을 반환하도록 보장
        DescribeConsumerGroupsResult describeConsumerGroupsResult = mock(DescribeConsumerGroupsResult.class);
        when(describeConsumerGroupsResult.all()).thenReturn(describeFuture);

        when(kafkaAdminClient.describeConsumerGroups(anyList()))
                .thenAnswer(invocation -> {
                    System.out.println("Step 2: describeConsumerGroups() 호출됨");
                    return describeConsumerGroupsResult;
                });

        // Offset Lag 시뮬레이션 (현재 Offset 10, Log-end Offset 20 -> Lag 10 발생)
        Map<TopicPartition, OffsetAndMetadata> offsets = new HashMap<>();
        offsets.put(new TopicPartition("notification-topic", 0), new OffsetAndMetadata(10));

        ListConsumerGroupOffsetsResult listConsumerGroupOffsetsResult = mock(ListConsumerGroupOffsetsResult.class);
        KafkaFuture<Map<TopicPartition, OffsetAndMetadata>> offsetsFuture = KafkaFuture.completedFuture(offsets);

        when(listConsumerGroupOffsetsResult.partitionsToOffsetAndMetadata()).thenReturn(offsetsFuture);
        when(kafkaAdminClient.listConsumerGroupOffsets(eq("notification-group"))).thenReturn(listConsumerGroupOffsetsResult);

        System.out.println("Step 0: KafkaMonitoringService = " + kafkaMonitoringService);
        System.out.println("Step 0.2: Test에서 사용되는 Mock kafkaAdminClient HashCode = " + System.identityHashCode(kafkaAdminClient));


        // 실행
        kafkaMonitoringService.checkConsumerLag();

        // Redis에 오류 메시지가 저장되는지 검증
        System.out.println("Step X: ValueOperations HashCode = " + System.identityHashCode(valueOperations));
        System.out.println("Step X.1: ValueOperations is Mock? " + Mockito.mockingDetails(valueOperations).isMock());

        verify(valueOperations, times(1))
                .set(startsWith("kafka_error:"), contains("Kafka Consumer Lag 감지됨"), eq(1L), eq(TimeUnit.HOURS));
    }




    // KafkaFuture 변환 유틸리티
    private <T> org.apache.kafka.common.KafkaFuture<T> toKafkaFuture(T value) {
        KafkaFutureImpl<T> future = new KafkaFutureImpl<>();
        future.complete(value);
        return future;
    }


}
