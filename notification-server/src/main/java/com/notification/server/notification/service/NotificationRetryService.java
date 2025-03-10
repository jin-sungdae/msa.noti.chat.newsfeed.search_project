package com.notification.server.notification.service;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.notification.server.notification.dto.NotificationMessage;
import com.notification.server.notification.mapper.NotificationMapper;
import com.notification.server.notification.model.Notification;
import com.notification.server.notification.model.NotificationStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationRetryService {

    private final NotificationMapper notificationMapper;
    private final KafkaTemplate<String, String> kafkaTemplate;
    private final ObjectMapper objectMapper;

    @Scheduled(fixedRate = 60000) // 1분마다 실행
    @Transactional
    public void retryFailedNotifications() {
        List<Notification> failedNotifications = notificationMapper.findFailedNotifications();

        for (Notification notification : failedNotifications) {
            if (Integer.parseInt(notification.getRetryCount()) >= 3) {
                notification.setStatus(NotificationStatus.PERMANENT_FAILED);
                notificationMapper.updateNotification(notification);
                continue;
            }

            try {

                NotificationMessage notificationMessage = NotificationMessage
                        .builder()
                        .userId(notification.getUserId())
                        .eventId(notification.getEventId())
                        .type(notification.getNotificationType())
                        .message(notification.getMessage())
                        .build();

                // Kafka 재시도 토픽으로 메시지 전송
                String message = objectMapper.writeValueAsString(notificationMessage);
                kafkaTemplate.send("retry-notification-topic", message);

                // 알림 상태를 RETRYING으로 업데이트
                notification.setStatus(NotificationStatus.RETRYING);
                notificationMapper.updateNotification(notification);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
