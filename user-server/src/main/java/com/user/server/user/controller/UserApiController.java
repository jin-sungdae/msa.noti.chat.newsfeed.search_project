package com.user.server.user.controller;

//import com.common.config.api.apidto.APIDataResponse;
import com.user.server.user.model.User;
import com.user.server.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/user")
public class UserApiController {
    private final UserService userService;


    @PostMapping("")
    public String createUser(@RequestBody User user) {


        userService.createUser(user);
        return "good";
    }
//
//
//    @PutMapping("")
//    public APIDataResponse<String> putExample() {
//
//        return APIDataResponse.of(Boolean.toString(true));
//    }
//
//
//    @DeleteMapping("")
//    public APIDataResponse<String> deleteExample() {
//
//        return APIDataResponse.of(Boolean.toString(true));
//    }

}
