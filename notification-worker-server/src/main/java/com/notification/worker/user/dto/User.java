package com.notification.worker.user.dto;

import lombok.*;

@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private String userId;
    private String name;
    private String email;
    private String phone;
    private String createdAt;

    private void setId(String id) {
        this.userId = id;
    }
}
