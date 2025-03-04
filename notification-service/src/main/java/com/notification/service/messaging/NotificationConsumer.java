package com.notification.service.messaging;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class NotificationConsumer {

    @KafkaListener(topics = "notifications", groupId = "notification-group")
    public void receiveNotification(String message) {
        System.out.println("Received notification: " + message);
    }
}
