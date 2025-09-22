package com.ohgiraffers.oop.abstraction.abclass;

public class BankTransfer extends Payment{
    public BankTransfer(String owner){
        super(owner);
    }

    @Override
    public void pay(int amount) {
        System.out.println(owner + "님이 계좌이체로" + amount + "원을 결제했습니다.");
    }
}
