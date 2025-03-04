package com.notification.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class User {
    private Long userId;
    private String name;
    private String email;
    private String phone;
    private String created_at;
}
