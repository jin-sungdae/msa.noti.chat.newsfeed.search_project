package com.notification.test.notification.mapper;

import com.notification.test.notification.dto.Notification;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationMapper {
    Notification findById(Long notificationId);

    void insertNotification(Notification notification);
}
