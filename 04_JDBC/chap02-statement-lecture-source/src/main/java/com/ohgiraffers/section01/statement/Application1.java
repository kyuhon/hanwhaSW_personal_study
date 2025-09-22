package com.ohgiraffers.section01.statement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static com.ohgiraffers.common.JDBCTemplate.getConnection;

public class Application1 {
    public static void main(String[] args) {
        Connection con = getConnection();
        System.out.println("con = " + con); // DB와의 연동 확인

        Statement stmt = null;              // SQL 및 쿼리 실행 결과를 싣고 dbms 오가는 트럭같은 개념
        ResultSet rset = null;              // 쿼리(SELECT)의 결과(JAVA의 타입)

        try {
            stmt = con.createStatement();
            rset = stmt.executeQuery("SELECT * FROM EMPLOYEE");

            while (rset.next()) {
                System.out.println(rset.getString("EMP_NAME"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally{

            /*코드의 줄 수를 줄이고 가독성을 높이기 위해 모듈화*/
            close(rset);
            close(stmt);
            close(con);
        }


    }
}
