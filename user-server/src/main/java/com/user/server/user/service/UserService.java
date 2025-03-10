package com.user.server.user.service;

import com.user.server.redis.RedisUserSettingsRepository;
import com.user.server.user.dto.RequestNotification;
import com.user.server.user.model.User;
import com.user.server.user.dto.UserSettings;
import com.user.server.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserMapper userMapper;
    private final RedisUserSettingsRepository redisUserSettingsRepository;
    private final WebClient webClient;

    public void createUser(User user) {

        try {
            UserSettings userSettings = UserSettings.builder()
                    .isPush("Y")
                    .isSms("Y")
                    .isEmail("Y")
                    .language("kr")
                    .build();
            userMapper.insertUser(user);
            redisUserSettingsRepository.saveUserSettings(user.getUserId(), userSettings);

            log.info("사용자 생성 완료: {}, 기본 알림 설정 저장 완료", user.getIndex());

            // WebClient로 비동기 알림 요청
            sendWelcomeNotification(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void sendWelcomeNotification(User user) {
        RequestNotification request = RequestNotification.builder()
                .userId(String.valueOf(user.getIndex()))
                .notificationType("EMAIL")
                .parameters(Map.of("username", user.getName(), "email", user.getEmail()))
                .build();

        webClient.post()
                .uri("/notifications/send")
                .bodyValue(request)
                .retrieve()
                .bodyToMono(String.class)
                .doOnSuccess(response -> log.info("웰컴 이메일 요청 성공: {}", response))
                .doOnError(error -> log.error(" 웰컴 이메일 요청 실패: {}", error.getMessage()))
                .subscribe();
    }
}
