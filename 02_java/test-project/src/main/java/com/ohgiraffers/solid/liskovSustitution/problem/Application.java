package com.ohgiraffers.solid.liskovSustitution.problem;

/*리스코프 치환 원칙(Liskov substitution Principle) = "상속 받으면 부모의 행동 양식을 바꾸지마!"
*  - 상위 타입의 객체를 하위 타입의 객체로 치환해도 프로그램의 정확성이 깨지지 않아야 한다
*  - 하위 타입은 상위 타입의 규칙(규약)을 지켜야 한다*/

public class Application {
    public static void main(String[] args) {
        System.out.println("직사각형 테스트");
        BadRectangle br = new BadRectangle();
        testRectangle(br);

        System.out.println("정사각형 테스트");
        BadRectangle br2 = new BadSquare();
        testRectangle(br2);
    }

    private static void testRectangle(BadRectangle badRectangle) {
        badRectangle.setWidth(5);
        badRectangle.setHeight(10);

        System.out.println("기대하는 넓이: 50");
        System.out.println("실제 넓이: " + badRectangle.getArea());

        System.out.println("제대로 동작 되었는지 확인: " + (badRectangle.getArea() == 50 ? "성공": "실패"));
    }
}
