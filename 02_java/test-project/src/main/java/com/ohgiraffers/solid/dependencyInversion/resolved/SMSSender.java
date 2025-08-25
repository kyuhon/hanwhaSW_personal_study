package com.ohgiraffers.solid.dependencyInversion.resolved;

public class SMSSender implements MessageSender {
    @Override
    public void sendMessage(String message) {
        System.out.println("SMS 발송: " + message);
    }
}
