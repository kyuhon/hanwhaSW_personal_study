package com.ohgiraffers.oop.abstraction.interf;

public class PayApp implements PaymentMethod{
    @Override
    public void pay(int amount) {
        System.out.println("카드로" + amount + "원 결제 완료");
    }
}
