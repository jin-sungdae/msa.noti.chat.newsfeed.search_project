package com.notification.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class SmsService {


    public boolean sendSms(Long userId, String message) {
        // TODO: Twilio API 등을 활용하여 SMS 전송
        log.info("SMS 전송 (userId: {}, message: {})", userId, message);
        return true;
    }
}
