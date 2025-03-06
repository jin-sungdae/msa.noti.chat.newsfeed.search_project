package com.notification.worker.notification.dto;

import com.notification.worker.notification.model.NotificationType;
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
