package com.ohgiraffers.oop.abstraction.interf;

public class Card implements PaymentMethod{

    @Override
    public void pay(int amount) {
        System.out.println("카드로 " + amount + "원 결제 완료");
    }
}
