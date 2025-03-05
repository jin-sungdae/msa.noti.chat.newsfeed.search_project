package com.notification.test.notification.dto;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class Notification {
    private Long notificationId;
    private Long userId;
    private String eventId;
    private NotificationType type;
    private String message;
    private NotificationStatus status;
    private LocalDateTime sentAt;
    private LocalDateTime createdAt;
}