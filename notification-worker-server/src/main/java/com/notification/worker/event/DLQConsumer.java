package com.notification.worker.event;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.CountDownLatch;

@Component
@Slf4j
@RequiredArgsConstructor
public class DLQConsumer {

    private final KafkaTemplate<String, String> kafkaTemplate;


    private CountDownLatch dlqLatch = new CountDownLatch(1);
    private String dlqPayload = null;

    @KafkaListener(topics = "error-topic", groupId = "dlq-producer-group")
    public void moveToDLQ(String failedMessage) {
        log.warn("DLQ로 이동하는 메시지: {}", failedMessage);
        kafkaTemplate.send("notification-dlq", failedMessage);
    }
    @KafkaListener(topics = "notification-dlq", groupId = "dlq-consumer-group")
    public void receiveFromDLQ(String message) {
        log.info("DLQ에서 메시지 수신: {}", message);
        this.dlqPayload = message;
        dlqLatch.countDown();
    }

    public CountDownLatch getDLQLatch() {
        return dlqLatch;
    }

    public String getDLQPayload() {
        return dlqPayload;
    }
}
