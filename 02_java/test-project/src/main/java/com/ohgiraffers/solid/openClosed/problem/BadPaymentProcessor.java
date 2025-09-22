package com.ohgiraffers.solid.openClosed.problem;

public class BadPaymentProcessor {
    public void processPayment(String paymentType){
        if(paymentType.equals("credit")){
            System.out.println("신용카드로 결제처리");
        } else if (paymentType.equals("kakao")){
            System.out.println("카카오페이로 결제처리");
        }


    }
}
