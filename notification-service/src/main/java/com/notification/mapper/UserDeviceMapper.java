package com.notification.mapper;

import com.notification.model.Device;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserDeviceMapper {
    List<Device> findByUserId(Long userId);
}
