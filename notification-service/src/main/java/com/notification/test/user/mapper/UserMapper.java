package com.notification.test.user.mapper;

import com.notification.test.user.dto.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    void insertUser(User user);

    User getUserById(String userId);
}
