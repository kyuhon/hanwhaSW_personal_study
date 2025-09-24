package com.ohgiraffers.userservice.dto;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Data
public class HelloDTO {
    @Value("Welcome to 19th SW-Camp")
    private String message;
}
