package com.notification.controller;

import com.common.config.api.apidto.APIDataResponse;
import com.notification.model.User;
import com.notification.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping("/register")
    public APIDataResponse<User> insertUser(@RequestBody User requestUser, HttpServletRequest request) {

        User user = userService.insertUser(requestUser);

        return APIDataResponse.of(user);
    }

    // 사용자 알림 설정 변경
    @PutMapping("/{userId}/preferences")
    public APIDataResponse<String> preferenceNotification(@PathVariable Long userId) {

        return APIDataResponse.of(Boolean.toString(true));
    }

    // 사용자 알림 로그 조회
    @GetMapping("/{userId}/notifications")
    public APIDataResponse<String> notificationLog(@PathVariable Long userId) {


        return APIDataResponse.of(Boolean.toString(true));
    }



}
