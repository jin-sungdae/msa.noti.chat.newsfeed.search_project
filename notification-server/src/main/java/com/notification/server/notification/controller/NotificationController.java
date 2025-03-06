package com.notification.server.notification.controller;



import com.common.config.api.apidto.APIDataResponse;
import com.notification.server.event.NotificationProducer;
import com.notification.server.notification.dto.NotificationMessage;
import com.notification.server.notification.dto.RequestNotification;
import com.notification.server.notification.repository.RedisUserSettingsRepository;
import com.notification.server.notification.service.NotificationService;
import com.notification.server.user.dto.UserSettings;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/v1/notifications")
public class NotificationController {

    private final NotificationProducer notificationProducer;
    private final NotificationService notificationService;
    private final RedisUserSettingsRepository redisUserSettingsRepository;


    @PostMapping("/send")
    public APIDataResponse<String> sendNotification(@RequestBody RequestNotification requets) {

        NotificationMessage notificationMessage = notificationService.createNotificationMessage(requets);

        notificationProducer.sendNotification(notificationMessage);

        return APIDataResponse.of(Boolean.toString(true));
    }

    @PostMapping("/send/batch")
    public APIDataResponse<Map<String, String>> sendBatchNotification(@RequestBody List<RequestNotification> requets) {

        List<String> userIdList = requets.stream().map(RequestNotification::getUserId).collect(Collectors.toList());

        Map<String, UserSettings> userSettingsMap = redisUserSettingsRepository.getUsersSettings(userIdList);
        Map<String, String> response = new HashMap<>();

        for (RequestNotification request : requets) {
            String userId = request.getUserId();
            UserSettings settings = userSettingsMap.getOrDefault(userId, new UserSettings("Y", "Y", "Y", "kr"));

            if (notificationService.shouldSendNotification(settings, request.getNotificationType())) {
                NotificationMessage notificationMessage = notificationService.createNotificationMessage(request);

                notificationProducer.sendNotification(notificationMessage);
                response.put(userId, "알림 전송 성공");
            } else {
                response.put(userId, "사용자가 알림을 비활성화했습니다.");
            }
        }



        return APIDataResponse.of(response);
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
