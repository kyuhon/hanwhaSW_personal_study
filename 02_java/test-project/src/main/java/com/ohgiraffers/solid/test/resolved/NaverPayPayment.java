package com.ohgiraffers.solid.test.resolved;

public class NaverPayPayment implements Payment {
    @Override
    public void process() {
        System.out.println("네이버페이결제완료");
    }
}
