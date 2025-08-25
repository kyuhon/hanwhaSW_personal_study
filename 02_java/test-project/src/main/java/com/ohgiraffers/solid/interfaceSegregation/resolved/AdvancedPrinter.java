package com.ohgiraffers.solid.interfaceSegregation.resolved;

public class AdvancedPrinter implements MultiFunctionPrinter {
    @Override
    public void fax() {
        System.out.println("팩스를 보냅니다");
    }

    @Override
    public void print() {
        System.out.println("문서를 출력합니다");
    }

    @Override
    public void scan() {
        System.out.println("스캔 가능");
    }
}
