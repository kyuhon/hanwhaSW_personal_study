package com.ohgiraffers.solid.openClosed.resolved;

public class NaverPayPayment implements Payment {
    @Override
    public void process() {
        System.out.println("네이버페이결제완료");
    }
}
