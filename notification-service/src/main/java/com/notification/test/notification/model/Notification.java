package com.notification.test.notification.model;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Map;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class Notification {
    private String notificationId;
    private String userId;
    private String eventId;
    private NotificationType notificationType;
    private String message;
    private NotificationStatus status;
    private LocalDateTime sentAt;
    private LocalDateTime createdAt;

    private void setId(String id) {
        this.notificationId = id;
    }
}