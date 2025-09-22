package com.ohgiraffers.asserions.section01.jupiter;

import com.ohgiraffers.assertions.section01.jupiter.Calculator;
import com.ohgiraffers.assertions.section01.jupiter.NumberValidator;
import com.ohgiraffers.assertions.section01.jupiter.Person;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class JupiterAssertionsTest {

    /* 수업목표. Junit5에서 제공하는 Assertions 메소드에 대해 이해하고 활용할 수 있다. */
    /* 설명. 1. assertEquals: 동등한지 비교해 주는 연산자로 참조 자료형끼리 비교할 경우에는
    *   e, h를 오버라이딩 할 것 */
    @Test
    public void testAssertEquals(){

        // given
        int firstNum = 10;
        int secondNum = 20;
        int expected = 31;

        // when: given을 대상에 적용
        Calculator calculator = new Calculator();
        int actual = calculator.plusTwoNumbers(firstNum, secondNum);

        // then: 그 결과를 판단
        Assertions.assertEquals(expected, actual, 1);
        // 3번째 매개변수는 오차범위 29와 31 통과
    }

    /* 설명. 2. assertNotEquals */
    @Test
    @DisplayName("인스턴스 동일성 비교 테스트")
    void testAssertNotEqualsWithInstance(){
        // given
        Object obj1 = new Object();

        // when
        Object obj2 = new Object();

        // then
        Assertions.assertNotEquals(obj1, obj2);

        /* 설명. Object는 e, h가 동일 비교로 작성되어 있다. */
    }

    /* 설명. 3. assertNull */
    @Test
    @DisplayName("Null인지 테스트")
    void testAssertNull(){
        String str;
        str = null;
        Assertions.assertNull(str);
    }

    /* 설명. 4. assertNotNull */
    @Test
    @DisplayName("Null이 아닌지 테스트")
    void testAssertNotNull(){
        String str;
        str = "java";
        Assertions.assertNotNull(str);
    }

    /* 설명. 5. assertAll */
    @Test
    @DisplayName("하나의 테스트 케이스에 대해 여러 검증을 한번에 수행하는 경우 테스트")
    void testAssertAll(){

        // given
        String firstName = "길동";
        String lastName = "홍";

        // when
        Person person = new Person(firstName, lastName);

        // then
        Assertions.assertAll(
                "그룹화된 테스트의 이름(테스트 실패 시 보여짐)",
                () -> Assertions.assertEquals(firstName, person.getFirstName(), () -> "firstName이 잘못됨"),
                () -> Assertions.assertEquals(lastName, person.getLastName(), () -> "lastName이 잘못됨")
        );
    }

    /* 설명. 6. assertThrows */
    @Test
    @DisplayName("void 메소드를 테스트하는 경우 어떤 exception이 발생했는지 테스트")
    void testAssertThrows(){
        int firstNum = 10;
        int secondNum = 0;
        String expectedMessage = "0으로 나눌 수 없습니다";

        NumberValidator validator = new NumberValidator();
        Exception exception = Assertions.assertThrows(
                Exception.class,
                () -> validator.checkDividableNumbers(firstNum, secondNum)
        );

        Assertions.assertAll(
                () -> Assertions.assertInstanceOf(IllegalArgumentException.class, exception,
                        () -> "예외 타입이 일치하지 않음"),
                () -> Assertions.assertEquals(expectedMessage, exception.getMessage(),
                        () -> "예외 메시지가 일치하지 않음")
        );

    }

}
