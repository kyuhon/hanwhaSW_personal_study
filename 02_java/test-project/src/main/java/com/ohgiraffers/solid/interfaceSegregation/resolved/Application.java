package com.ohgiraffers.solid.interfaceSegregation.resolved;

public class Application {
    public static void main(String[] args) {
        BasicPrinter bp = new BasicPrinter();
        bp.print();

        AdvancedPrinter ap = new AdvancedPrinter();
        ap.print();
        ap.fax();
        ap.scan();
    }
}
