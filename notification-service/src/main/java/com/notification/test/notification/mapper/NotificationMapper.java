package com.notification.test.notification.mapper;

import com.notification.test.notification.dto.NotificationLog;
import com.notification.test.notification.dto.RequestNotification;
import com.notification.test.notification.model.Notification;
import com.notification.test.notification.dto.NotificationMessage;
import com.notification.test.notification.dto.NotificationTemplate;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationMapper {
    Notification findById(String eventId);

    NotificationTemplate findTemplateByNotification(RequestNotification notification);

    void insertNotification(Notification notification);

    void insertNotificationTemplate(NotificationMessage notificationMessage);

    void insertNotificationLog(NotificationLog logEntry);


    void updateNotification(Notification notification);

}
