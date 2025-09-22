package com.ohgiraffers.oop.inheritance;

public class Car extends Vehicle{
    int seatCount;
    public Car(String brand, int speed, int seatCount){
        super(brand, speed);
        this.seatCount = seatCount;
    }

    public void openTrunk(){
        System.out.println("트렁크를 엽니다.");
    }
}
