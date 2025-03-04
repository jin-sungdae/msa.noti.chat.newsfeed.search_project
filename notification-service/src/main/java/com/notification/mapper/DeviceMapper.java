package com.notification.mapper;

import com.notification.model.Device;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Optional;

@Mapper
public interface DeviceMapper {

    void insertDevice(Device device);

    List<Device> getDevicesByUserId(@Param("userId") Long userId);

    // 특정 디바이스 토큰으로 조회
    Optional<Device> getDeviceByToken(@Param("deviceToken") String deviceToken);

    // 특정 사용자의 특정 플랫폼(iOS, Android) 디바이스 목록 조회
    List<Device> getDevicesByUserIdAndPlatform(@Param("userId") Long userId, @Param("platform") String platform);

    // 특정 사용자의 디바이스 삭제
    void deleteDeviceByUserIdAndToken(@Param("userId") Long userId, @Param("deviceToken") String deviceToken);

}
