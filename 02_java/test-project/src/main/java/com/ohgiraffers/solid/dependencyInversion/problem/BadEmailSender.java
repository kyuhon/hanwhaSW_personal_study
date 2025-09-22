package com.ohgiraffers.solid.dependencyInversion.problem;

public class BadEmailSender {
    public void sendEmail(String message) {
        System.out.println("이메일 발송: " + message);
    }
}
