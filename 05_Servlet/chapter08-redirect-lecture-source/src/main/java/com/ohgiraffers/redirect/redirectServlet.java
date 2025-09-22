package com.ohgiraffers.redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/redirect")
public class redirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("리다이렉트 이후 request의 attribute 확인: " + req.getAttribute("test"));
        System.out.println("리다이렉트 이후 request의 parameter 확인: " + req.getParameter("test"));
    }
}
