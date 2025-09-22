package com.ohgiraffers.oop.abstraction.interf;

public class Main {
    public static void main(String[] args) {
        PaymentMethod method1 = new Card();
        method1.pay(30000);

        PaymentMethod method2 = new Card();
        method2.pay(45000);
    }
}
