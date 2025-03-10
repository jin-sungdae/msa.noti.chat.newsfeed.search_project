package com.notification.server.notification.dto;

import com.notification.server.notification.model.NotificationStatus;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NotificationLog {
    private String notificationLogId;
    private String notificationId;
    private NotificationStatus notificationStatus;
    private String retryCount;
    private String errorMessage;
    private LocalDateTime createdAt;
}
