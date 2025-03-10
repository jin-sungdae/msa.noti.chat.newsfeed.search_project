package com.notification.worker.notification.controller;

import com.common.config.api.apidto.APIDataResponse;
import com.notification.worker.notification.service.NotificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/v1/notifications")
public class NotificationController {


    private final NotificationService notificationService;


    @GetMapping("/{notificationId}/read")
    public APIDataResponse<String> markAsRead(@PathVariable String notificationId) {

        boolean success = notificationService.markNotificationAsRead(notificationId);

        if (success) {
            return APIDataResponse.of(Boolean.toString(true));
        } else {
            return APIDataResponse.of(Boolean.toString(false));
        }

    }

}
