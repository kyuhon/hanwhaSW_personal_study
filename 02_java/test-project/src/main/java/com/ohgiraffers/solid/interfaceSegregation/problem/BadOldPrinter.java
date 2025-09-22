package com.ohgiraffers.solid.interfaceSegregation.problem;

public class BadOldPrinter implements BadOldMachine {

    @Override
    public void print() {
        System.out.println("문서를 힘겹게 인쇄합니다.");
    }

    @Override
    public void fax() {
        /* fax기능은 지원조차 되지 않음 */
    }

    @Override
    public void scan() {
        /* scan 기능은 지원조차 되지 않음 */
    }
}
