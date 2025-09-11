package com.ohgiraffers.section01.xmlconfig;

import java.util.List;

public class MenuController {
    private final MenuService menuService;

    public MenuController(){
        this.menuService = new MenuService();
    }

    public void findAllMenus(){
        List<MenuDTO> menuList = menuService.findAllMenus();
    }
}
