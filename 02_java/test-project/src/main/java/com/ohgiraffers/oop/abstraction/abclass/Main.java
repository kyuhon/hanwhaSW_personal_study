package com.ohgiraffers.oop.abstraction.abclass;

public class Main {
    public static void main(String[] args) {
        Payment p1 = new CardPayment("김철수");
        p1.showOwner();
        p1.pay(50000);

        Payment p2 = new BankTransfer("이영희");
        p2.showOwner();
        p2.pay(120000);
    }
}
