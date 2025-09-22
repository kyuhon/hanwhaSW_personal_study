package com.ohgiraffers.solid.openClosed.resolved;

    /* Payment 인터페이스를 통해 새로운 결제 수단을 기존 코드의 수정 없이 쉽게 추가
       PaymentProcessor 클래스는 구체적인 결제 방식을 알 필요 없이 Payment 인터페이스만 의존(결합)한다

    */
public class Application {
    public static void main(String[] args) {
        PaymentProcessor pp = new PaymentProcessor();
        pp.processPayment(new CreditCardPayment());
        pp.processPayment(new kakaoPayPayment());
        pp.processPayment(new NaverPayPayment());
    }
}
