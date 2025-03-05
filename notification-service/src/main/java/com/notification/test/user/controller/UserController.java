package com.notification.test.user.controller;


import com.notification.test.user.dto.User;
import com.notification.test.user.service.UserService;
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
    public String insertUser(@RequestBody User requestUser, HttpServletRequest request) {

        User user = userService.insertUser(requestUser);

        return "hi";
    }

    // 사용자 알림 설정 변경
    @PutMapping("/{userId}/preferences")
    public String preferenceNotification(@PathVariable Long userId) {

        return "hi";
    }



}
