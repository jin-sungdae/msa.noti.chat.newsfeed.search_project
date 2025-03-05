package com.notification.test.user.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    private String userId;
    private String name;
    private String email;
    private String phone;
    private String created_at;
}
