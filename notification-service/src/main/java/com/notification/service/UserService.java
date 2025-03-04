package com.notification.service;

import com.notification.mapper.UserMapper;
import com.notification.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    @Transactional
    public User insertUser(User requestUser) {

        try {
            userMapper.insertUser(requestUser);
            return userMapper.getUserById(requestUser.getUserId());
        } catch (Exception e) {

        }

        return null;
    }
}
