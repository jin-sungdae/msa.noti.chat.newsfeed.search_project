package com.notification.worker.monitoring.controller;

import com.notification.worker.monitoring.service.KafkaMonitoringService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.Mockito.doNothing;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@ExtendWith(SpringExtension.class)
@WebMvcTest(KafkaMonitoringController.class)
public class KafkaMonitoringControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private KafkaMonitoringService kafkaMonitoringService;

    @MockBean
    private RedisTemplate<String, String> redisTemplate;

    @Test
    void checkConsumerLag_정상호출() throws Exception {
        // Given
        doNothing().when(kafkaMonitoringService).checkConsumerLag();

        // When & Then
        mockMvc.perform(get("/api/v1/monitoring/consumer-lag"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.data").value("Kafka Consumer 상태 확인 완료"));
    }
}
