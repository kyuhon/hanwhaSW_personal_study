package com.ohgiraffers.section03.additional;

import org.junit.jupiter.api.*;

import java.util.concurrent.TimeUnit;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class AdditionalAnnotationTest {

    @Test
    @Disabled   // 잠깐 테스트를 중지하는데 사용
    public void testIgonre(){
        System.out.println("testIgonre");
    }

    @Test
    @Timeout(value = 1000, unit = TimeUnit.MILLISECONDS)    // 1초안에 이 테스트 케이스를 통과했는가
    public void testTimeout() throws InterruptedException {
        Thread.sleep(900);
    }

    @Test
    @Order(1)
    public void testFirst(){}

    @Test
    @Order(3)
    public void testThird(){}

    @Test
    @Order(2)
    public void testSecond(){}




}
