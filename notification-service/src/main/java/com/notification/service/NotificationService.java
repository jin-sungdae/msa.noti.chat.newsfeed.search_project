package com.notification.service;


import com.google.gson.Gson;
import com.notification.mapper.DeviceMapper;
import com.notification.model.Device;
import com.notification.model.Notification;
import com.notification.dto.NotificationRequest;
import com.notification.mapper.NotificationMapper;
import com.notification.model.NotificationStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NotificationService {

    private final NotificationMapper notificationMapper;
    private final DeviceMapper deviceMapper;
    private final KafkaTemplate<String, String> kafkaTemplate;

    public void processNotification(NotificationRequest request) {

    }

}
