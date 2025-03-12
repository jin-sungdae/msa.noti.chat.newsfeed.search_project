package com.notification.worker.monitoring;

import org.apache.kafka.clients.producer.KafkaProducer;

import java.util.Map;

public class KafkaProducerTestHelper {
    public static KafkaProducer<String, String> getSimpleProducer() {
        Map<String, Object> props = Map.of(
                // bootstrap server 설정
                "bootstrap.servers", "localhost:9092",
                // kafka 로 전송할 message 의 s/d 클래스 설정
                "key.serializer", "org.apache.kafka.common.serialization.StringSerializer",
                "value.serializer", "org.apache.kafka.common.serialization.StringSerializer"
        );
        return new KafkaProducer<>(props);
    }
}
