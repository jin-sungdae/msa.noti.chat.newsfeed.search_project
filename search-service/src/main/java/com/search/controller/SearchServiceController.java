package com.search.controller;

import com.search.dto.Search;
import com.search.service.SearchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/search")
public class SearchServiceController {

    private final SearchService searchService;

    @GetMapping
    public List<Search> getAllNotifications() {
        return searchService.getAllNotifications();
    }
}
