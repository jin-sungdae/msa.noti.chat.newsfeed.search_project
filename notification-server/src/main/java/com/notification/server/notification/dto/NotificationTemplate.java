package com.notification.server.notification.dto;

import com.notification.server.notification.model.NotificationType;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NotificationTemplate {
    private String notificationTemplateId;
    private NotificationType notificationType;
    private String templateName;
    private String content;
    private LocalDateTime createdAt;


    private void setId(String id) {
        this.notificationTemplateId = id;
    }
}
