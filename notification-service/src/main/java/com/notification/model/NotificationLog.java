package com.notification.model;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NotificationLog {

    private Long notificationLogId;
    private Long notificationId;
    private NotificationStatus status;
    private int retryCount;
    private String errorMessage;
    private LocalDateTime createdAt;
}
