package com.notification.server.notification.model;



import lombok.*;

import java.time.LocalDateTime;


@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class Notification {
    private String notificationId;
    private String userId;
    private String eventId;
    private String retryCount;
    private NotificationType notificationType;
    private String message;
    private NotificationStatus status;
    private String isRead;
    private LocalDateTime readAt;
    private LocalDateTime sentAt;
    private LocalDateTime createdAt;

    private void setId(String id) {
        this.notificationId = id;
    }

    public void incrementRetryCount() {
        this.retryCount = String.valueOf(Integer.parseInt(this.retryCount) + 1);
    }
}