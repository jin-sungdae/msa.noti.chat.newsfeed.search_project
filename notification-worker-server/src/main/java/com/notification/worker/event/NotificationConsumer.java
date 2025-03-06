package com.notification.worker.event;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.notification.worker.notification.dto.NotificationLog;
import com.notification.worker.notification.dto.NotificationMessage;
import com.notification.worker.notification.model.Notification;
import com.notification.worker.notification.model.NotificationStatus;
import com.notification.worker.notification.mapper.NotificationMapper;
import com.notification.worker.notification.service.EmailService;
import com.notification.worker.notification.service.PushService;
import com.notification.worker.notification.service.SmsService;
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

    @KafkaListener(topics = "${kafka.topic.notification}", groupId = "notification-group")
    public void consumeNewNotifications(String message) {
        log.info("새로운 알림 처리");
        processNotification(message);
    }

    @KafkaListener(topics = "retry-notification-topic", groupId = "notification-group")
    public void consumeRetryNotifications(String message) {
        log.info("재시도 알림 처리");
        processNotification(message);
    }


    private void processNotification(String message) {
        try {
            // 메시지 직력화
            ObjectMapper objectMapper = new ObjectMapper();
            NotificationMessage event = objectMapper.readValue(message, NotificationMessage.class);

            log.info(" kafka 메시지 수신 : {}", event);

            boolean isSent;
            String errorMessage = null;

            // 알림전송 처리
            try {
                isSent = sendNotification(event);
            } catch (Exception e) {
                isSent = false;
                errorMessage = e.getMessage();
            }


            // 알림 상태 업데이트
            Notification notification = notificationMapper.findById(event.getEventId());

            if (notification != null) {

                notification.setStatus(isSent ? NotificationStatus.SENT : NotificationStatus.FAILED);
                notification.setSentAt(LocalDateTime.now());
                notification.setRetryCount(isSent ? notification.getRetryCount() : String.valueOf(Integer.parseInt(notification.getRetryCount()) + 1));

                // 기존 알림 상태 업데이트
                notificationMapper.updateNotification(notification);
                log.info("알림 상태 업데이트 : {}", notification);

                // notification_log 에 기록
                NotificationLog logEntry = NotificationLog
                        .builder()
                        .notificationId(notification.getNotificationId())
                        .notificationStatus(isSent ? NotificationStatus.SENT : NotificationStatus.FAILED)
                        .retryCount(notification.getRetryCount())
                        .errorMessage(errorMessage)
                        .createdAt(LocalDateTime.now())
                        .build();

                notificationMapper.insertNotificationLog(logEntry);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private boolean sendNotification(NotificationMessage event) throws Exception {

        switch (event.getType().toString()) {
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