package com.notification.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@RequiredArgsConstructor
public class Device {
    private Long id;
    private Long userId;
    private String deviceToken;
    private LocalDateTime createdAt;
}