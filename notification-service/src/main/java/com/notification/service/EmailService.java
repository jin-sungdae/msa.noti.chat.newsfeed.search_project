package com.notification.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class EmailService {

    public boolean sendEmail(Long userId, String message) {
        // TODO: 실제 이메일 전송 로직 (JavaMailSender 사용 가능)
        log.info("이메일 발송 (userId: {}, message: {})", userId, message);
        return true;
    }
}
