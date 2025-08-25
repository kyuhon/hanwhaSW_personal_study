package com.ohgiraffers.solid.openClosed.problem;

public class Application {
    public static void main(String[] args) {
       BadPaymentProcessor bpp = new BadPaymentProcessor();
       bpp.processPayment("credit");
       bpp.processPayment("kakao");
    }
}
