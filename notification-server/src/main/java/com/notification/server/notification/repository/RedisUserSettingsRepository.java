package com.notification.server.notification.repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.notification.server.notification.dto.UserSettings;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class RedisUserSettingsRepository {

    private final RedisTemplate<String, String> redisTemplate;
    private final ObjectMapper objectMapper;

    private static final String USER_SETTINGS_KEY = "user:%s:settings";


    /**
     * 특정 사용자의 알림 설정을 조회
     */
    public Optional<UserSettings> getUserSettings(String userId) {
        String key = String.format(USER_SETTINGS_KEY, userId);
        String value = redisTemplate.opsForValue().get(key);

        if (value == null) return Optional.empty();

        try {
            return Optional.of(objectMapper.readValue(value, UserSettings.class));
        } catch (JsonProcessingException e) {
            return Optional.empty();
        }
    }

    /**
     * 여러 사용자의 알림 설정을 일괄 조회 (Redis MGET 사용)
     */
    public Map<String, UserSettings> getUsersSettings(List<String> userIds) {
        List<String> keys = userIds.stream()
                .map(id -> String.format(USER_SETTINGS_KEY, id))
                .collect(Collectors.toList());

        List<String> values = redisTemplate.opsForValue().multiGet(keys);
        Map<String, UserSettings> result = new HashMap<>();

        for (int i = 0; i < userIds.size(); i++) {
            if (values != null && values.get(i) != null) {
                try {
                    UserSettings settings = objectMapper.readValue(values.get(i), UserSettings.class);
                    result.put(userIds.get(i), settings);
                } catch (JsonProcessingException e) {
                    result.put(userIds.get(i), new UserSettings());
                }
            } else {
                result.put(userIds.get(i), new UserSettings());
            }
        }

        return result;
    }
}
