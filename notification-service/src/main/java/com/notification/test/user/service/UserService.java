package com.notification.test.user.service;



import com.notification.test.user.dto.User;
import com.notification.test.user.mapper.UserMapper;
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

            System.out.println(requestUser);

            return userMapper.getUserById(requestUser.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
