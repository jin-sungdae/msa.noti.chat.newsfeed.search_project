package com.notification.worker.notification.dto;


import com.notification.worker.notification.model.NotificationType;
import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Builder
public class NotificationMessage implements Serializable {
    private String userId;  // 알림을 받을 사용자 ID
    private String eventId;
    private NotificationType type;  // 알림 유형 (PUSH, SMS, EMAIL)
    private String message;  // 최종적으로 치환된 알림 메시지


    @Override
    public String toString() {
        return "NotificationMessage{" +
                "userId=" + userId +
                "eventId=" + eventId +
                ", type='" + type + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
