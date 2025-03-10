package com.notification.server.notification.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

    public boolean sendEmail(String userId, String message) {
        return true;
    }
}

