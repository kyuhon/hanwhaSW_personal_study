package com.ohgiraffers.oop.encapsulation;

public class BankAccount {
    // 1. 필드는 private -> 외부에서 직접 접근 불가
    private String ownerName;
    private double balance;

    // 2. 생성자
    public BankAccount(String ownerName, double balance) {
        this.ownerName = ownerName;
        this.balance = balance;
    }

    public double getBalance() {
        return balance;
    }
    public void deposit(double amount) {
        if (amount > 0){
            balance += amount;
        }
    }

    public boolean withdraw(double amount) {
        if (amount > 0 && balance >= amount){
            balance -= amount;
            return true;
        }
        return false;
    }
}
