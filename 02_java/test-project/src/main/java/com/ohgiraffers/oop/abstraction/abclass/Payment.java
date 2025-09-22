package com.ohgiraffers.oop.abstraction.abclass;


abstract class Payment {
    String owner;

    public Payment(String owner) {
        this.owner = owner;
    }

    //공통 매서드
    public void showOwner(){
        System.out.println("결제자: " + owner);
    }

    //추상 메서드 (구현은 자식이 맡음)
    public abstract void pay(int amount);
}
