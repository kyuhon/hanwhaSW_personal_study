package com.ohgiraffers.oop.abstraction;

public class Bird extends Animal implements Flyable{
    Bird(String name){super(name);}
    @Override
    void sound() {
        System.out.println("짹짹");
    }

    @Override
    public void fly() {
        System.out.println(name + "이(가) 날아간다.");
    }
}
