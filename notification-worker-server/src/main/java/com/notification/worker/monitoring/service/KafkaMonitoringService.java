package com.notification.worker.monitoring.service;

import com.fasterxml.jackson.databind.deser.std.StringDeserializer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.admin.AdminClient;
import org.apache.kafka.clients.admin.ConsumerGroupDescription;
import org.apache.kafka.clients.admin.DescribeConsumerGroupsResult;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.OffsetAndMetadata;
import org.apache.kafka.common.KafkaFuture;
import org.apache.kafka.common.TopicPartition;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
@Slf4j
public class KafkaMonitoringService {

    private final AdminClient kafkaAdminClient;
    private final RedisTemplate<String, String> redisTemplate;

//    @Scheduled(fixedRate = 60000)
    public void checkConsumerLag() {
        try {

            Map<String, ConsumerGroupDescription> consumerGroups = kafkaAdminClient
                    .describeConsumerGroups(List.of("notification-group"))
                    .all()
                    .get();


            for (ConsumerGroupDescription group : consumerGroups.values()) {
                log.info("Kafka Consumer Group: {} | 상태: {}", group.groupId(), group.state());

                // Lag 체크 추가
                Map<TopicPartition, OffsetAndMetadata> consumerOffsets = kafkaAdminClient
                        .listConsumerGroupOffsets("notification-group")
                        .partitionsToOffsetAndMetadata()
                        .get();

                for (Map.Entry<TopicPartition, OffsetAndMetadata> entry : consumerOffsets.entrySet()) {
                    TopicPartition partition = entry.getKey();
                    OffsetAndMetadata offsetMetadata = entry.getValue();

                    long latestOffset = getLatestOffset(partition);
                    long consumerOffset = offsetMetadata.offset();
                    long lag = latestOffset - consumerOffset;

                    if (lag > 0) {
                        String errorMessage = "Kafka Consumer Lag 감지됨: "
                                + "Topic: " + partition.topic()
                                + ", Partition: " + partition.partition()
                                + ", Lag: " + lag;
                        saveKafkaErrorToRedis(errorMessage);
                    }
                }
            }
        } catch (Exception e) {
            log.error("Kafka Consumer 상태 조회 실패", e);
            saveKafkaErrorToRedis("Kafka Consumer 상태 조회 실패: " + e.getMessage());
        }
    }

    protected long getLatestOffset(TopicPartition partition) {
        try (KafkaConsumer<String, String> consumer = createKafkaConsumer()) {
            Map<TopicPartition, Long> endOffsets = consumer.endOffsets(List.of(partition));
            return endOffsets.getOrDefault(partition, -1L);
        }
    }

    private KafkaConsumer<String, String> createKafkaConsumer() {
        Properties props = new Properties();
        props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "kafka:9092");
        props.put(ConsumerConfig.GROUP_ID_CONFIG, "monitoring-group");
        props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        return new KafkaConsumer<>(props);
    }


    public void saveKafkaErrorToRedis(String errorMessage) {
        String errorKey = "kafka_error:" + System.currentTimeMillis();
        redisTemplate.opsForValue().set(errorKey, errorMessage, 1, TimeUnit.HOURS);
        log.warn("Kafka 오류 저장: {}", errorMessage);
    }

}
