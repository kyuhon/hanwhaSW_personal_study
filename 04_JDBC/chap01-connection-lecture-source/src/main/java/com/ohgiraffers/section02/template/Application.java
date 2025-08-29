package com.ohgiraffers.section02.template;

import java.sql.Connection;

import static com.ohgiraffers.section02.template.JDBCTemplate.close;
import static com.ohgiraffers.section02.template.JDBCTemplate.getConnection;

public class Application {
    public static void main(String[] args) {
        /* main 로직에서 Connection 객체가 필요한 순간에 한줄 코딩으로 받아내기 */
        // Connection con = JDBCTemplate.getConnection();
        Connection con = getConnection();
        System.out.println("Con = " + con);

        /*설명. connection 객체를 활용한 구문(SQL문을 통해 DB와의 CRUD)*/

        // JDBCTemplate.class(con);
        close(con);
    }
}
