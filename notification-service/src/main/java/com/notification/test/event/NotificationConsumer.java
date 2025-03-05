package com.notification.test.event;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.notification.test.notification.dto.Notification;
import com.notification.test.notification.dto.NotificationStatus;
import com.notification.test.notification.mapper.NotificationMapper;
import com.notification.test.notification.service.EmailService;
import com.notification.test.notification.service.PushService;
import com.notification.test.notification.service.SmsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;


import java.time.LocalDateTime;

@Component
@Slf4j
@RequiredArgsConstructor
public class NotificationConsumer {

    private final NotificationMapper notificationMapper;
    private final EmailService emailService;
    private final SmsService smsService;
    private final PushService pushService;

    @KafkaListener(topics = "notifications-event", groupId = "notification-group")
    public void consume(String message) {

        try {
            // 메시지 직력화
            ObjectMapper objectMapper = new ObjectMapper();
            NotificationEvent event = objectMapper.readValue(message, NotificationEvent.class);

            log.info(" kafka 메시지 수신 : {}", event);

            // 알림전송 처리
            boolean isSent = sendNotification(event);

            // 알림 상태 업데이트
            Notification notification = notificationMapper.findById(event.getNotificationId());

            if (notification != null) {
                notification.setStatus(isSent ? NotificationStatus.SENT : NotificationStatus.FAILED);
                notification.setSentAt(LocalDateTime.now());
                notificationMapper.insertNotification(notification);
                log.info("알림 상태 업데이트 : {}", notification);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Received notification: " + message);
    }

    private boolean sendNotification(NotificationEvent event) {

        switch (event.getType()) {
            case "EMAIL":
                return emailService.sendEmail(event.getUserId(), event.getMessage());
            case "SMS":
                return smsService.sendSms(event.getUserId(), event.getMessage());
            case "PUSH":
                return pushService.sendPushNotification(event.getUserId(), event.getMessage());
            default:
                log.error("지원되지 않는 알림 타입: {}", event.getType());
                return false;
        }
    }
}