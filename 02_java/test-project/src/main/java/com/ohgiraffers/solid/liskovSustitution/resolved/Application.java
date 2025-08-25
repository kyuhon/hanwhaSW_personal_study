package com.ohgiraffers.solid.liskovSustitution.resolved;

public class Application {
    /* Rectangle과 Square는 다른 부분이 많으니 별도의 타입으로 정의하고
    *  공통적인 부분만 인터페이스*/
    public static void main(String[] args) {
        Shape rectangle = new Rectangle(5,10);
        System.out.println("직사각형의 넓이: " + rectangle.getArea());

        Shape square = new square(5);
        System.out.println("정사각형의 넓이: " + square.getArea());
    }
}
