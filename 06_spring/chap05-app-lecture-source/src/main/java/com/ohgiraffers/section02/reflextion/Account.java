package com.ohgiraffers.section02.reflextion;


public class Account {
    private String bankCode;
    private String accNo;
    private String accPwd;
    private int balance;

    public Account(){
    }

    public Account(String bankCode, String accNo, String accPwd, int balance) {
        this.bankCode = bankCode;
        this.accNo = accNo;
        this.accPwd = accPwd;
        this.balance = balance;
    }

    public int getBalance() {
        return balance;
    }
}
