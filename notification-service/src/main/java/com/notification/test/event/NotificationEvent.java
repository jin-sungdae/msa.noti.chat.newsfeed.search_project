package com.notification.test.event;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NotificationEvent {
    private Long notificationId;
    private Long userId;
    private String message;
    private String type;  // EMAIL, SMS, PUSH
}