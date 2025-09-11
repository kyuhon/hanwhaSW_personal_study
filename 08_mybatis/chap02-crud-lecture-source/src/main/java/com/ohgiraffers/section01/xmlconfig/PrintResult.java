package com.ohgiraffers.section01.xmlconfig;

import java.util.List;

public class PrintResult {
    public void printMenus(List<MenuDTO> menuList) {
        menuList.forEach(System.out::println);
    }

    /* 설명. */
    public void printErrorMessage(String message) {
        System.out.println("에러 메시지: " + message);
    }
}
