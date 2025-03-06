package com.notification.server.notification.controller;



import com.common.config.api.apidto.APIDataResponse;
import com.notification.server.event.NotificationProducer;
import com.notification.server.notification.dto.NotificationMessage;
import com.notification.server.notification.dto.RequestNotification;
import com.notification.server.notification.service.NotificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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
