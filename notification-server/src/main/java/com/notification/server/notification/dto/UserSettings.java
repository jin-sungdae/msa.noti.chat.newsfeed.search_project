package com.notification.server.notification.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserSettings {
    private String isPush;
    private String isSms;
    private String isEmail;
    private String language;

}
