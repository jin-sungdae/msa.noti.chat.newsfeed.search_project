package com.newsfeed.mapper;

import com.newsfeed.dto.Newsfeed;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NewsfeedMapper {
    @Select("SELECT * FROM newsfeed")
    List<Newsfeed> getAllNewsfeed();
}
