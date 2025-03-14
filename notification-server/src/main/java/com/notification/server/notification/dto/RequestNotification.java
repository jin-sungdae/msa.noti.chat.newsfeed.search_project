package com.notification.server.notification.dto;


import com.notification.server.notification.model.NotificationType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class RequestNotification {

    private String userId;
    private NotificationType notificationType;
    private Map<String, String> parameters;

}
