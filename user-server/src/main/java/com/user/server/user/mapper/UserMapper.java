package com.user.server.user.mapper;

import com.user.server.user.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {


    void insertUser(User user);
}
