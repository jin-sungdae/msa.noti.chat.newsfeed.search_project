package com.notification.model;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class NotificationPreference {
    private Long notificationPreferenceId;
    private Long userId;
    private Boolean emailEnabled;
    private Boolean smsEnabled;
    private Boolean pushEnabled;
    private LocalDateTime createdAt;
}
