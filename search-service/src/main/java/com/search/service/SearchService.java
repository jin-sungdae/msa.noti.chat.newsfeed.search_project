package com.search.service;


import com.search.dto.Search;
import com.search.mapper.SearchMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class SearchService {

    private final SearchMapper searchMapper;


    public List<Search> getAllNotifications() {
        return searchMapper.getAllSearch();
    }
}
