package com.notification.dto;

import com.notification.model.NotificationStatus;
import com.notification.model.NotificationType;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class NotificationRequest {
    private Long notificationId;
    private Long userId;
    private String eventId;
    private NotificationType type;
    private String message;
    private NotificationStatus status;
}
