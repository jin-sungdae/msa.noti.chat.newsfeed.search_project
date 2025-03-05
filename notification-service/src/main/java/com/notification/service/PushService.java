package com.notification.service;

import com.notification.mapper.UserDeviceMapper;
import com.notification.model.Device;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class PushService {

    private final UserDeviceMapper userDeviceMapper;

    public boolean sendPushNotification(Long userId, String message) {

        List<Device> devices = userDeviceMapper.findByUserId(userId);
        if (devices.isEmpty()) {
            log.warn("푸시 알림을 보낼 디바이스 없음 (userId : {})", userId);
            return false;
        }

        boolean success = false;

        for (Device device : devices) {
            try {
                if ("iOS".equals(device.getPlatform())) {
                    success = sendApnsPush(device.getDeviceToken(), message);
                } else if ("Android".equals(device.getPlatform())) {
                    success = sendFcmPush(device.getDeviceToken(), message);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    private boolean sendApnsPush(String deviceToken, String message) {

        // APNS (IOS) 푸시 전송 로직

        log.info("APNS 푸시 알림 전송 (deviceToken : {}, message : {}", deviceToken, message);
        return true;
    }

    private boolean sendFcmPush(String deviceToken, String message) {
        // Firebase FCM 푸시 전송 로직

        log.info("FCM 푸시 알림 전송 (deviceToken : {}, message : {}", deviceToken, message);
        return true;
    }
}
