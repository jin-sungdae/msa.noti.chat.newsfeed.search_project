package com.notification.server.notification.service;


import com.notification.server.notification.dto.NotificationMessage;
import com.notification.server.notification.dto.NotificationTemplate;
import com.notification.server.notification.dto.RequestNotification;
import com.notification.server.notification.dto.UserSettings;
import com.notification.server.notification.mapper.NotificationMapper;
import com.notification.server.notification.model.Notification;
import com.notification.server.notification.model.NotificationStatus;


import com.notification.server.notification.model.NotificationType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {

    private final NotificationMapper notificationMapper;

    @Transactional
    public NotificationMessage createNotificationMessage (RequestNotification requestNotification) {

        try {
            NotificationTemplate notificationTemplate = notificationMapper.findTemplateByNotification(requestNotification);

            String eventId = generateEventId(requestNotification.getNotificationType().toString(), requestNotification.getUserId());
            String parseMessage = parseTemplate(notificationTemplate.getContent(), requestNotification.getParameters());


            Notification notification = Notification.builder()
                    .userId(requestNotification.getUserId())
                    .eventId(eventId)
                    .message(parseMessage)
                    .status(NotificationStatus.PENDING)
                    .notificationType(requestNotification.getNotificationType())
                    .build();

            notificationMapper.insertNotification(notification);

            return new NotificationMessage(requestNotification.getUserId(), eventId, requestNotification.getNotificationType(), parseMessage);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public boolean markNotificationAsRead(String notificationId) {
        Notification notification = notificationMapper.findById(notificationId);

        if (notification != null && notification.getIsRead().equals("N")) {
            notification.setIsRead("Y");
            notification.setReadAt(LocalDateTime.now());  // 읽은 시간 저장
            notificationMapper.updateNotification(notification);
            log.info("알림 읽음 처리 완료: {}", notificationId);
            return true;
        }

        return false;
    }


    private String generateEventId(String notificationType, String userId) {
        long timeStamp = Instant.now().toEpochMilli();

        return notificationType + "-" + userId + "-" + timeStamp;
    }

    private String parseTemplate(String template, Map<String, String> parameters) {
        for (Map.Entry<String, String> entry : parameters.entrySet()) {
            template = template.replace("{" + entry.getKey() + "}", entry.getValue());
        }
        return template;
    }


    public boolean shouldSendNotification(UserSettings settings, NotificationType notificationType) {
        if (settings == null) {
            log.warn("사용자 설정이 없음. 기본값으로 알림 허용");
            return true;
        }

        return switch (notificationType) {
            case PUSH -> settings.getIsPush().equals("Y") ? true : false;
            case SMS -> settings.getIsSms().equals("Y") ? true : false;
            case EMAIL -> settings.getIsEmail().equals("Y") ? true : false;
        };
    }
}
