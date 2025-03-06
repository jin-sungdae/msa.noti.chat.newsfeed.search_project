package com.notification.worker.user.mapper;

import com.notification.worker.user.dto.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    void insertUser(User user);

    User getUserById(String userId);
}
