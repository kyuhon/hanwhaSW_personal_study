package com.ohgiraffers.oop.encapsulation;

public class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount("김철수", 1000);

        // account.balance = -500; 직접 접근불가 -> 데이터 보호
        account.deposit(500);
        account.withdraw(200);

        System.out.println(account.getBalance());
    }
}
