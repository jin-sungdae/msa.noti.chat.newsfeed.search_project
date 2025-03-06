package com.notification.worker.user.controller;


import com.common.config.api.apidto.APIDataResponse;
import com.notification.worker.user.dto.User;
import com.notification.worker.user.service.UserService;
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
    public String preferenceNotification(@PathVariable Long userId) {

        return "hi";
    }



}
