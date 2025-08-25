package com.ohgiraffers.section03.additional;

import org.junit.jupiter.api.*;

import java.util.concurrent.TimeUnit;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class AddictionalAnnotationTest {
    @Test
    @Disabled       // 테스트 케이스 생략 시
    public void testIgnore(){}

    @Test
    @Timeout(value = 1000, unit = TimeUnit.MILLISECONDS)    // 타임아웃 체크 시
    public void testTimeout() throws InterruptedException{
        Thread.sleep(1001);
    }

    /* 테스트 클래스에 @TestMethodOrder 어노테이션을 추가해서 낮은 숫자가 먼저 동작하게 테스트 코드 작성*/
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
