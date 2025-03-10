package com.chat.service;

import com.chat.dto.Chat;
import com.chat.mapper.ChatMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChatService {

    private final ChatMapper chatMapper;


    public List<Chat> getAllChat() {

        return chatMapper.getAllChat();
    }
}
