package com.notification.worker.monitoring.service;


import com.notification.worker.event.DLQConsumer;
import com.notification.worker.event.NotificationConsumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.Duration;
import java.util.Collections;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doThrow;

@ExtendWith(SpringExtension.class)
@SpringBootTest
public class KafkaDLQIntegratiohnTest {


    @Autowired
    private DLQConsumer dlqConsumer;

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @SpyBean
    private NotificationConsumer notificationConsumer;

    @Test
    @DisplayName("DLQ 통합 테스트 - KafkaConsumer 예외 유발")
    void testDLQMechanism() throws InterruptedException {


        doThrow(new RuntimeException("강제 오류 발생! Kafka 메시지 처리 실패"))
                .when(notificationConsumer)
                .consumeNewNotifications(anyString());

        kafkaTemplate.send("notification-topic", "Test message for DLQ");
        System.out.println("Producer: 메시지 전송 완료 - notification-topic");

        // DLQ 메시지가 정상적으로 도착했는지 확인
        boolean messageReceived = dlqConsumer.getDLQLatch().await(20, TimeUnit.SECONDS);



        assertThat(messageReceived).isTrue();
        assertThat(dlqConsumer.getDLQPayload()).isEqualTo("Test message for DLQ");

        System.out.println(" DLQ 메시지 확인 완료: " + dlqConsumer.getDLQPayload());
    }
}
