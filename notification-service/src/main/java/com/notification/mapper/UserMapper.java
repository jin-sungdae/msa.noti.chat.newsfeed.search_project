package com.notification.mapper;

import com.notification.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    void insertUser(User user);

    User getUserById(Long userId);
}
