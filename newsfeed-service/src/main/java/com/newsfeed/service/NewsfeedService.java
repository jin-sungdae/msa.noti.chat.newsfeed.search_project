package com.newsfeed.service;

import com.newsfeed.mapper.NewsfeedMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class NewsfeedService {
    private final NewsfeedMapper newsfeedMapper;
}
