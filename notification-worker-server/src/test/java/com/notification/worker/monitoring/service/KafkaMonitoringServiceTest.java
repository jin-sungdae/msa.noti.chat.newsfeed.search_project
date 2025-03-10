package com.notification.worker.monitoring.service;

import static org.mockito.Mockito.*;

import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.ConsumerGroupDescription;
import org.apache.kafka.clients.admin.DescribeConsumerGroupsResult;
import org.apache.kafka.common.KafkaFuture;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

@ExtendWith(MockitoExtension.class)
@Slf4j
class KafkaMonitoringServiceTest {

    @Mock
    private AdminClient kafkaAdminClient;

    @InjectMocks
    private KafkaMonitoringService kafkaMonitoringService;

    @BeforeEach
    void setUp() {
        log.info("KafkaMonitoringServiceTest 시작");
    }

    @Test
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
}
