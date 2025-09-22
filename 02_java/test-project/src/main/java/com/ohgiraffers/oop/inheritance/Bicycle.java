package com.ohgiraffers.oop.inheritance;

public class Bicycle extends Vehicle{
    boolean hasBell;

    public Bicycle(String brand, int speed, boolean hasBell){
        super(brand, speed);
        this.hasBell = hasBell;
    }

    public void ringBell(){
        if(hasBell){
            System.out.println("따르릉~");
        }else{
            System.out.println("벨이 없습니다.");
        }
    }
}
