package com.newsfeed.controller;

import com.newsfeed.service.NewsfeedService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/newsfeed")
@RequiredArgsConstructor
public class NewsfeedController {

    private final NewsfeedService newsfeedService;
}
