package com.user.server.main;

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
public class mainController {



    @GetMapping("/main")
    public ModelAndView textbookRegisterList(
            @RequestParam Map<String, Object> reqMap,

            Model model
    ) {


        ModelAndView mv = new ModelAndView("/user/join");


        return mv;
    }
}
