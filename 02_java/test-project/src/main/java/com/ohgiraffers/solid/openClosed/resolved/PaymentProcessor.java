package com.ohgiraffers.solid.openClosed.resolved;

public class PaymentProcessor {
    public void processPayment(Payment payment) {
        payment.process();
    }
}
