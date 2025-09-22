package com.ohgiraffers.asserions.section02.assertj;

import com.ohgiraffers.assertions.section01.jupiter.NumberValidator;
import com.ohgiraffers.assertions.section02.assertj.Member;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.Arrays;
import java.util.List;

public class AssertjTest {

    @Test
    @DisplayName("문자열 테스트하기")
    void testSpringValidation() {
        // given
        String expected = "hello world";

        // when
        String actual = new String(expected);

        // then
        Assertions.assertThat(actual)
                .isNotEmpty()
                .isNotBlank()
                .contains("hello")
                .doesNotContain("hahaha")
                .startsWith("h")
                .endsWith("d")
                .isEqualTo(expected);
    }

    @Test
    @DisplayName("숫자 테스트하기")
    void testIntegerValidation(){
        double pi = Math.PI;

        Double actual = pi;

        Assertions.assertThat(actual)
                .isPositive()
                .isGreaterThan(3)
                .isLessThan(4)
                .isEqualTo(Math.PI);
    }

    @Test
    @DisplayName("날짜 테스트하기")
    void testLocalDateTimeValidation(){
        String birthday = "2014-09-18T16:42:00.000";

        LocalDateTime theDay = LocalDateTime.parse(birthday);

        System.out.println("theDay: " + theDay);
        System.out.println("now: " + LocalDateTime.now());


        Assertions.assertThat(theDay)
                .hasYear(2014)
                .hasMonthValue(9)
                .hasMonth(Month.SEPTEMBER)
                .hasDayOfMonth(18)
                .isBetween("2014-01-01T00:00:00.000", "2014-12-31T23:59:59.000")
                .isBefore(LocalDateTime.now());
    }

    @Test
    @DisplayName("예외 테스트하기")
    void testExceptionValidation(){
        int firstNum = 10;
        int secondNum = 0;
        NumberValidator numberValidator = new NumberValidator();
        Exception exception = org.junit.jupiter.api.Assertions.assertThrows(
                Exception.class,
                () -> numberValidator.checkDividableNumbers(firstNum, secondNum)
        );

        Assertions.assertThat(exception)
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("0으로");
    }

    @Test
    @DisplayName("filtering assertions 테스트하기")
    void testFilteringAssertions(){
        Member member1 = new Member(1, "user01", "홍길동", 20);
        Member member2 = new Member(2, "user02", "유관순", 16);
        Member member3 = new Member(3, "user03", "이순신", 40);
        Member member4 = new Member(4, "user04", "신사임당", 45);
        Member member5 = new Member(5, "user05", "임꺽정", 19);

        List<Member> members = Arrays.asList(member1, member2, member3, member4, member5);

        Assertions.assertThat(members)
                .filteredOn("age",20);
    }


}
