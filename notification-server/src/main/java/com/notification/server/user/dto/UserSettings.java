package com.notification.server.user.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class UserSettings {
    private String isPush;
    private String isSms;
    private String isEmail;
    private String language;
}
