package com.chat.controller;

import com.chat.dto.Chat;
import com.chat.service.ChatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/chat")
public class ChatController {

    private final ChatService chatService;

    @GetMapping
    public List<Chat> getAllChat() {
        return chatService.getAllChat();
    }
}
