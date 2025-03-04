package com.notification.controller;


import com.notification.dto.NotificationRequest;
import com.notification.service.NotificationService;
import com.notification.service.messaging.NotificationProducer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/notifications")
public class NotificationController {

    private final NotificationService notificationService;
    private final NotificationProducer producer;

    @PostMapping
    public ResponseEntity<String> sendNotification(@RequestBody NotificationRequest request) {
        notificationService.processNotification(request);
        return ResponseEntity.ok("Notification request received.");
    }

    @GetMapping("/send")
    public String sendNotification(@RequestParam String message) {
        producer.sendNotification(message);
        return "Sent: " + message;
    }
}
