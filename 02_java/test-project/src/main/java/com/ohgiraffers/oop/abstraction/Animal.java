package com.ohgiraffers.oop.abstraction;

abstract class Animal {
    String name;
    Animal(String name) { this.name = name; }
    abstract void sound();
    void eat(){
        System.out.println(name + "이(가) 먹는다.");
    }
}
