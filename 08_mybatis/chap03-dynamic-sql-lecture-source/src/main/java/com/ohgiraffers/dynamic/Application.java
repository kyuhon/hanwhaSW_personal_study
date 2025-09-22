package com.ohgiraffers.dynamic;

import java.util.Scanner;

public class Application {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        do{
            System.out.println("===== 마이바티스 동작 SQL =====");
            System.out.println("1. if 확인하기");
            System.out.println("2. choose(when, otherwise) 확인하기");
            System.out.println("3. foreach 확인하기");
            System.out.println("4. trim(where, set) 확인하기");
            System.out.println("9. 종료하기");
            System.out.println("메뉴를 선택하세요: ");
            int input = sc.nextInt();
            switch (input){
                case 1:
                    ifSubMenu();
                    break;
                case 2:
                    chooseSubMenu();
                    break;
                case 3:
                    foreachSubMenu();
                    break;
                case 9:
                    System.out.println("프로그램을 종료합니다.");
                    return;
                default:
                    System.out.println("번호를 잘못 입력하셨습니다.");
            }
        }while(true);
    }

    private static void foreachSubMenu() {
        Scanner sc = new Scanner(System.in);
        MenuService ms = new MenuService();
    }

    private static void chooseSubMenu() {
        Scanner sc = new Scanner(System.in);
        MenuService ms = new MenuService();
        do {
            System.out.println("===== choose 서브 메뉴 =====");
            System.out.println("1. 카테고리 상위 분류별 메뉴 보여주기(식사, 음료, 디저트)");
            System.out.println("9. 이전 메뉴로");
            System.out.println("메뉴 번호를 입력해 주세요: ");
            int input = sc.nextInt();
            switch (input){
                case 1:
                    ms.searchMenuBySubCategory(inputSubCategory());
                    break;
                case 9:
                    return;
            }
        } while(true);
    }

    private static SearchCriteria inputSubCategory() {
        Scanner sc = new Scanner(System.in);
        System.out.println("메뉴의 상위 분류를 입력해 주세요(식사, 음료, 디저트): ");
        String value = sc.nextLine();
        return new SearchCriteria("category", value);
    }

    private static void ifSubMenu() {
        Scanner sc = new Scanner(System.in);
        MenuService ms = new MenuService();

        do {
            System.out.println("===== if 서브메뉴 =====");
            System.out.println("1. 원하는 금액대에 적합한 추천 메뉴 목록 보여주기");
            System.out.println("2. 메뉴 이름 혹은 카테고리명으로 검색하여 메뉴 목록 보여주기");
            System.out.println("9. 이전 메뉴로");
            System.out.println("메뉴 번호를 입력해 주세요: ");
            int input = sc.nextInt();
            switch (input){
                case 1:
                    ms.findMenuByPrice(inputPrice());
                    break;
                case 2:
                    ms.searchMenu(inputSearchCriteria());
                    break;
                case 9:
                    return;
            }
        } while(true);
    }

    /* 설명. 검색을 위해 필요한 내용만을 가지는 SearchCriteria를 반환하는 메소드 */

    private static SearchCriteria inputSearchCriteria(){

        Scanner sc = new Scanner(System.in);
        System.out.println("검색 기준을 입력해 주세요(name or category): ");
        String condition = sc.nextLine();
        System.out.println("검색어를 입력해 주세요: ");
        String value = sc.nextLine();

        return new SearchCriteria(condition, value);
    }

    private static int inputPrice(){
        Scanner sc = new Scanner(System.in);
        System.out.println("검색 할 가격대의 최대 금액을 입력해 주세요: ");   // 0, 1만, 2만, 3만 구간에서 입력한 가격까지
        return sc.nextInt();
    }
}
