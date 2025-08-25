package com.ohgiraffers.section02.lifecycle;

import org.junit.jupiter.api.*;

public class LifeCycleAnnotationTest {

    /* - 모든 테스트 메소드와 라이프사이클 관련 메소드는 abstract이면 안되고, void 반환형으로 작성해야한다.
    *  - 접근 제어자는 사용해도 되지만(default), private이면 안된다.
    *  - BeforeAll과 AfterAll은 static이어야 한다.
    * */

    @BeforeAll
    public static void beforeAll() {
        System.out.println("beforeAll");
    }

    @BeforeEach
    public void beforeEach() {
        System.out.println("beforeEach");
    }

    @Test
    public void test1(){
        System.out.println("test1");
    }

    @Test
    public void test2(){
        System.out.println("test2");
    }

    @AfterEach
    public void afterEach() {
        System.out.println("afterEach");
    }

    @AfterAll
    public static void afterAll() {
        System.out.println("afterAll");
    }

}
