package com.notification.controller;


import com.common.config.api.apidto.APIDataResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.notification.dto.NotificationRequest;
import com.notification.service.NotificationService;
import com.notification.event.NotificationProducer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/notifications")
public class NotificationController {

    private final NotificationService notificationService;
    private final NotificationProducer producer;

    // 알림 생성
    @PostMapping
    public APIDataResponse<String> sendNotification(@RequestBody NotificationRequest request) throws JsonProcessingException {

        notificationService.processNotification(request);

        return APIDataResponse.of(Boolean.toString(true));
    }


    // 실패한 알림 재시도
    @PostMapping("/retry/{notificationId}")
    public APIDataResponse<String> retryNotification() {


        return APIDataResponse.of(Boolean.toString(true));
    }


    // 알림 상태 조회
    @GetMapping("/{notificationId}")
    public String sendNotification(@PathVariable Long notificationId, @RequestParam String message) {


        producer.sendNotification(message);



        return "Sent: " + message;
    }
}
