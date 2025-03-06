package com.user.server.user.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    @GetMapping("/user/join")
    public ModelAndView userJoin(
            @RequestParam Map<String, Object> reqMap,
            Model model
    ) {


        ModelAndView mv = new ModelAndView("/user/join");


        return mv;
    }
}
