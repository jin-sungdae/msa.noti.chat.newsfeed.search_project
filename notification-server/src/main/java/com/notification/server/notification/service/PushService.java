package com.notification.server.notification.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PushService {

    public boolean sendPushNotification(String userId, String message) {

        return true;
    }
}
