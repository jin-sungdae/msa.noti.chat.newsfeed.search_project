package com.notification.test.notification.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SmsService {



    public boolean sendSms(String userId, String message) throws Exception {
        throw new Exception("error");
    }
}
