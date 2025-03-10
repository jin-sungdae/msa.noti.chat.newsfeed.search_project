package com.admin.server.monitoring.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@Controller
@RequiredArgsConstructor
@Slf4j
public class MonitoringController {

    private final RedisTemplate<String, String> redisTemplate;

    @GetMapping("/monitor/kafka")
    public ModelAndView monitorKafka(
            @RequestParam Map<String, Object> reqMap,
            Model model
    ) {

        ModelAndView mv = new ModelAndView("/monitor/kafka");
        Set<String> keys = redisTemplate.keys("kafka_error:*");
        Map<String, String> errorLogs = new HashMap<>();

        if (keys != null) {
            for (String key : keys) {
                errorLogs.put(key, redisTemplate.opsForValue().get(key));
            }
        }

        mv.addObject("list", errorLogs);

        return mv;
    }
}
