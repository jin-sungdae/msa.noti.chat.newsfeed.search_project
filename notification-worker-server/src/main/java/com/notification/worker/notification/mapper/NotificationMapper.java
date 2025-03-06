package com.notification.worker.notification.mapper;

import com.notification.worker.notification.dto.NotificationLog;
import com.notification.worker.notification.dto.RequestNotification;
import com.notification.worker.notification.model.Notification;
import com.notification.worker.notification.dto.NotificationTemplate;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface NotificationMapper {
    Notification findById(String eventId);

    NotificationTemplate findTemplateByNotification(RequestNotification notification);

    void insertNotification(Notification notification);


    void insertNotificationLog(NotificationLog logEntry);


    void updateNotification(Notification notification);

}
