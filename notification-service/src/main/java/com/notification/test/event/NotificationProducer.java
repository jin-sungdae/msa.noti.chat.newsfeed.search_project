package com.notification.test.event;

import com.google.gson.Gson;
import com.notification.test.notification.dto.NotificationMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@RequiredArgsConstructor
public class NotificationProducer {

    private final KafkaTemplate<String, String> kafkaTemplate;

    @Value("${kafka.topic.notification}")
    private String notificationTopic;

    public void sendNotification(NotificationMessage message) {
        String paylod = new Gson().toJson(message);

        log.info("sending notification : {} ", paylod);

        kafkaTemplate.send(notificationTopic, paylod);
    }
}