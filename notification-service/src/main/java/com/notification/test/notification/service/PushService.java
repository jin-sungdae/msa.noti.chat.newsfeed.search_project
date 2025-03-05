package com.notification.test.notification.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PushService {

    public boolean sendPushNotification(Long userId, String message) {

        return false;
    }
}
