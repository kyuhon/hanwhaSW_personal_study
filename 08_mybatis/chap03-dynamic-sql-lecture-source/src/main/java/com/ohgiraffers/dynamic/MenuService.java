package com.ohgiraffers.dynamic;

import org.apache.ibatis.session.SqlSession;

import static com.ohgiraffers.dynamic.Template.getSqlSession;

public class MenuService {
    public void findMenuByPrice(int maxPrice) {
        SqlSession sqlSession = getSqlSession();
        System.out.println("sqlSesion = " + sqlSession);
    }
}
