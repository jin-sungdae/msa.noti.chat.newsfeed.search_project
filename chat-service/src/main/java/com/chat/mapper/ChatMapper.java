package com.chat.mapper;

import com.chat.dto.Chat;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    List<Chat> getAllChat();
}
