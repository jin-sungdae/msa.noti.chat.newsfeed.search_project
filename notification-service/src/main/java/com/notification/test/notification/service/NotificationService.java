package com.notification.test.notification.service;

import com.notification.test.notification.dto.RequestNotification;
import com.notification.test.notification.model.Notification;
import com.notification.test.notification.dto.NotificationMessage;
import com.notification.test.notification.mapper.NotificationMapper;
import com.notification.test.notification.model.NotificationStatus;
import com.notification.test.notification.dto.NotificationTemplate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
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

}
