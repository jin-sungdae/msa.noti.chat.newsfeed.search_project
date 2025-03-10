package com.notification.server.notification.mapper;

import com.notification.server.notification.dto.NotificationLog;
import com.notification.server.notification.dto.RequestNotification;
import com.notification.server.notification.model.Notification;
import com.notification.server.notification.dto.NotificationMessage;
import com.notification.server.notification.dto.NotificationTemplate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NotificationMapper {
    Notification findById(String eventId);

    NotificationTemplate findTemplateByNotification(RequestNotification notification);

    void insertNotification(Notification notification);

    void insertNotificationTemplate(NotificationMessage notificationMessage);

    void insertNotificationLog(NotificationLog logEntry);


    void updateNotification(Notification notification);

    List<Notification> findFailedNotifications();
}
