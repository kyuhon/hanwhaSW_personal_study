package com.ohgiraffers.userservice.controller;

import com.ohgiraffers.userservice.dto.*;
import com.ohgiraffers.userservice.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
public class UserController {

    private Environment env;
    private HelloDTO hello;
    private UserService userService;
    private ModelMapper modelMapper;

    public UserController(Environment env,
                          UserService userService,
                          ModelMapper modelMapper,
                          HelloDTO hello) {
        this.env = env;
        this.userService = userService;
        this.modelMapper = modelMapper;
        this.hello = hello;
    }

    @GetMapping("/health")
    public String status() {
        return "I'm Woking in User Service "
                + env.getProperty("local.server.port");
    }

    @GetMapping("/welcome")
    public String welcom() {
        return hello.getMessage();
    }

    /* 설명. 로그인 기능 전 회원가입 기능 먼저 만들기 */
    @PostMapping("/users")
    public ResponseEntity<ResponseRegistUserDTO> registUser(@RequestBody RequestRegistUserDTO newUser) {
        UserDTO userDTO = modelMapper.map(newUser, UserDTO.class);

        userService.registUser(userDTO);

        ResponseRegistUserDTO responseUser = modelMapper.map(userDTO, ResponseRegistUserDTO.class);
        return ResponseEntity.status(HttpStatus.CREATED).body(responseUser);
    }

    @GetMapping("/users/{memNo}")
    public ResponseEntity<ResponseFindUserDTO> getUsers(@PathVariable String memNo) {
        UserDTO userDTO = userService.getUserById(memNo);

        ResponseFindUserDTO responseUser = modelMapper.map(userDTO, ResponseFindUserDTO.class);

        return ResponseEntity.status(HttpStatus.OK)
                .body(responseUser);
    }
}
