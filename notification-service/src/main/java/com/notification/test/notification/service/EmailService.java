package com.notification.test.notification.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

    public boolean sendEmail(Long userId, String message) {
        return false;
    }
}

