package com.user.server.user.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String index;
    private String name;
    private String userId;
    private String password;
    private String birth;
    private String email;
    private String phoneNumber;
    private String address;
}
