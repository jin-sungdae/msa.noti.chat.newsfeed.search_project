package com.search.mapper;


import com.search.dto.Search;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper

public interface SearchMapper {
    @Select("SELECT * FROM notifications")
    List<Search> getAllSearch();
}
