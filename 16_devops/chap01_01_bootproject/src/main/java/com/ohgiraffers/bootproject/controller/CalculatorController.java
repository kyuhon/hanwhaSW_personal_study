package com.ohgiraffers.bootproject.controller;

import com.ohgiraffers.bootproject.dto.CalculatorDTO;
import com.ohgiraffers.bootproject.service.CalculatorService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
public class CalculatorController {
    CalculatorService calculatorService;

    @Autowired
    public CalculatorController(CalculatorService calculatorService) {
        this.calculatorService = calculatorService;
    }

    @GetMapping("/plus")
    public ResponseEntity<CalculatorDTO> plusTwoNumbers(CalculatorDTO calculatorDTO){
        log.info("calculatorDTO = {}", calculatorDTO);
        int result = calculatorService.plusTwoNumbers(calculatorDTO);
        calculatorDTO.setSum(result);
        return ResponseEntity.ok().body(calculatorDTO);
    }
}
