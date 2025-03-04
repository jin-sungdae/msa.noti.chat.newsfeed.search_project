package com.notification.model;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NotificationTemplate {
    private Long notificationTemplateId;
    private NotificationType type;
    private String templateName;
    private String content;
    private LocalDateTime createdAt;
}
