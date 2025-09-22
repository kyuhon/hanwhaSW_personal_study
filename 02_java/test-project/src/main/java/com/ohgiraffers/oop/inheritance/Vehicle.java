package com.ohgiraffers.oop.inheritance;

public class Vehicle {
    String brand; // 인스턴스 변수
    int speed;

    public Vehicle(String brand, int speed) {
        // this.brand 현재 생성되는 객체의 brand
        // brand 생성자 매개변수 brand
        this.brand = brand;
        this.speed = speed;
    }

    public void move(){
        System.out.println(brand + "가" + speed + "km/h로 이동합니다");
    }
}
