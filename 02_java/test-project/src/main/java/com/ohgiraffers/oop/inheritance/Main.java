package com.ohgiraffers.oop.inheritance;

public class Main {
    public static void main(String[] args) {
        Car car = new Car("현대",120,5);
        car.move();
        car.openTrunk();

        Bicycle bike = new Bicycle("삼천리", 20, true);
        bike.move();
        bike.ringBell();
    }
}
