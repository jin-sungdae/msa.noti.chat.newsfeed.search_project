package com.notification.test.notification.controller;

import com.common.config.api.apidto.APIDataResponse;
import com.notification.test.event.NotificationProducer;
import com.notification.test.notification.dto.RequestNotification;
import com.notification.test.notification.dto.NotificationMessage;
import com.notification.test.notification.service.NotificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/v1/notifications")
public class NotificationController {

    private final NotificationProducer notificationProducer;
    private final NotificationService notificationService;


    @PostMapping("/send")
    public APIDataResponse<String> sendNotification(@RequestBody RequestNotification requets) {

        NotificationMessage notificationMessage = notificationService.createNotificationMessage(requets);

        notificationProducer.sendNotification(notificationMessage);

        return APIDataResponse.of(Boolean.toString(true));
    }

}
