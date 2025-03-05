package com.notification.mapper;

import com.notification.model.Notification;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Optional;

@Mapper

public interface NotificationMapper {

    void insertNotification(Notification notification);

    Optional<Notification> getNotificationByUserId(Integer usreId);

    Optional<Boolean> existsByEventId(String userId);

    Notification findById(Long notificationId);
}
