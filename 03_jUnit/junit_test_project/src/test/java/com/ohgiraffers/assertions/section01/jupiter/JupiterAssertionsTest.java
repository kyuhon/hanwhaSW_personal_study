package com.ohgiraffers.assertions.section01.jupiter;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class JupiterAssertionsTest {
    /* Junit5에서 제공하는 Assertions 메소드에 대해 이해하고 활용할 수 있다.
    *  1. assertEquals: 동등한지 비교해 주는 연산자로 참조 자료형끼리 비교할 경우에는 e, h를 오버라이딩 할 것*/
    @Test
    public void testAssertEquals(){

        // given : 테스트를 하기 위한 준비물
        int firstNum = 10;
        int secondNum = 20;
        int expected = 31;

        // when : given을 대상에 적용
        Calculator calculator = new Calculator();
        int actual = calculator.plusTwoNumbers(firstNum, secondNum);

        // then : 그 결과를 판단
        Assertions.assertEquals(expected, actual);
        Assertions.assertEquals(expected, actual,1);
        Assertions.assertEquals(expected, actual, "이건 정확해야 해");
    }
        /* 2. assertNotEquals*/
        @Test
        @DisplayName("인스턴스 동일성 비교 테스트")
        void testAssertNotEqualsWithInstances(){
            // given
            Object obj1 = new Object();
            // when
            Object obj2 = new Object();
            // then
            Assertions.assertNotEquals(obj1, obj2);

            /* Object는 e, h가 동일 비교로 작성되어 있다.*/
    }
    /* assertNull */
    @Test
    @DisplayName("Null인지 테스트")
    void testAssertNull(){
        String str;
        str = "java";
        Assertions.assertNotNull(str);
    }
}
