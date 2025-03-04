package com.notification.controller;

import com.common.config.api.apidto.APIDataResponse;
import com.notification.model.User;
import com.notification.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v1/users/register")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @PostMapping
    public APIDataResponse<User> insertUser(@RequestBody User requestUser, HttpServletRequest request) {

        User user = userService.insertUser(requestUser);

        return APIDataResponse.of(user);
    }
}
