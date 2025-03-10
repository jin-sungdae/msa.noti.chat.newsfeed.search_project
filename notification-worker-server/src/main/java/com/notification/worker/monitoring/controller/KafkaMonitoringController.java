package com.notification.worker.monitoring.controller;

import com.common.config.api.apidto.APIDataResponse;
import com.notification.worker.monitoring.service.KafkaMonitoringService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@RestController
@RequestMapping("/api/v1/monitoring")
@RequiredArgsConstructor
public class KafkaMonitoringController {

    private final KafkaMonitoringService kafkaMonitoringService;
    private final RedisTemplate<String, String> redisTemplate;

    @GetMapping("/consumer-lag")
    public APIDataResponse<String> checkConsumerLag() {
        kafkaMonitoringService.checkConsumerLag();
        return APIDataResponse.of("Kafka Consumer 상태 확인 완료");
    }

    @GetMapping("/failed-notifications")
    public APIDataResponse<Map<String, String>> getFailedNotifications() {
        Set<String> keys = redisTemplate.keys("failed_notifications:*");
        Map<String, String> failedNotifications = new HashMap<>();

        if (keys != null) {
            for (String key : keys) {
                failedNotifications.put(key, redisTemplate.opsForValue().get(key));
            }
        }

        return APIDataResponse.of(failedNotifications);
    }
}
