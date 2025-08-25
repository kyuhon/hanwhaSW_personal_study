package com.ohgiraffers.solid.dependencyInversion.problem;

public class BadSMSSender {
    public void sendSMS(String message) {
        System.out.println("문자 발송: " + message);
    }
}
