package com.ohgiraffers.oop.abstraction.abclass;

public class CardPayment extends Payment{
    public CardPayment(String owner){
        super(owner);
    }

    @Override
    public void pay(int amount) {
        System.out.println(owner + "님이 카드로" + amount + "원을 결제했습니다.");
    }
}
