package com.notification.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.notification.event.NotificationEvent;
import com.notification.mapper.DeviceMapper;
import com.notification.model.Device;
import com.notification.model.Notification;
import com.notification.dto.NotificationRequest;
import com.notification.mapper.NotificationMapper;
import com.notification.model.NotificationStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NotificationService {

    private final NotificationMapper notificationMapper;
    private final DeviceMapper deviceMapper;
    private final KafkaTemplate<String, String> kafkaTemplate;

    public void processNotification(NotificationRequest request) throws JsonProcessingException {
        Notification notification = Notification.builder()
                .userId(request.getUserId())
                .message(request.getMessage())
                .eventId(request.getEventId())
                .type(request.getType())
                .status(NotificationStatus.PENDING)
                .build();

        notificationMapper.insertNotification(notification);
        log.info("알림 저장 완료 : {}", notification);

        // kafka 메시지 전송
        NotificationEvent event = new NotificationEvent(
                notification.getNotificationId(),
                notification.getUserId(),
                notification.getMessage(),
                notification.getType().toString());

        kafkaTemplate.send("notification-events",
                notification.getUserId().toString(),
                new ObjectMapper().writeValueAsString(event));


        log.info("Kafka에 메시지 전송 완료: {}", event);
    }

}
