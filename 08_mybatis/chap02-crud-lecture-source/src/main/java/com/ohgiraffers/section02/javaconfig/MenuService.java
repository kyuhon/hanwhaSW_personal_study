package com.ohgiraffers.section02.javaconfig;

import com.ohgiraffers.section01.xmlconfig.MenuDAO;
import com.ohgiraffers.section01.xmlconfig.MenuDTO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.ohgiraffers.section01.xmlconfig.Template.getSqlSession;

public class MenuService {
    private MenuMapper menuMapper;


    public List<com.ohgiraffers.section01.xmlconfig.MenuDTO> findAllMenus() {
        SqlSession sqlSession = getSqlSession();
        /* 설명.
        *   SqlSession을 활용해서 인터페이스의 하위 구현체를 DAO에 해당하는 객체로 만들어 쿼리 실행
        * */
        menuMapper = sqlSession.getMapper(MenuMapper.class);
        List<MenuDTO> menuList = menuMapper.selectAllMenus();
        sqlSession.close();
        return menuList;
    }

    public MenuDTO findMenuByMenuCode(int menuCode) {
        SqlSession sqlSession = getSqlSession();
        menuMapper = sqlSession.getMapper(MenuMapper.class);
        MenuDTO menu = menuMapper.selectMenuByMenuCode(menuCode);
        sqlSession.close();
        return menu;
    }

    public boolean registMenu(com.ohgiraffers.section01.xmlconfig.MenuDTO menu) {
        SqlSession sqlSession = getSqlSession();
        int result = menuDAO.insertMenu(sqlSession, menu);

        if(result == 1) {
            sqlSession.commit();
        } else {
            sqlSession.rollback();
        }

        sqlSession.close();
        return result == 1? true: false;
    }

    public boolean modifyMenu(MenuDTO menu) {
        SqlSession sqlSession = getSqlSession();
        int result = menuDAO.updateMenu(sqlSession, menu);

        if(result == 1) {
            sqlSession.commit();
        } else {
            sqlSession.rollback();
        }

        sqlSession.close();
        return result == 1? true: false;
    }

    public boolean removeMenu(int menuCode) {
        SqlSession sqlSession = getSqlSession();
        menuMapper = sqlSession.getMapper(MenuMapper.class);
        int result = menuMapper.deleteMenu(sqlSession, menuCode);

        if(result == 1) {
            sqlSession.commit();
        } else {
            sqlSession.rollback();
        }

        sqlSession.close();
        return result == 1? true: false;
    }

}
