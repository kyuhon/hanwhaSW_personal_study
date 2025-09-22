package com.ohgiraffers.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/context")
public class ContextListenerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("context listener 확인용 servlet!");

        ServletContext context = req.getServletContext();

        context.setAttribute("test1", "value1");
        context.setAttribute("test2", "value2");
        context.setAttribute("test2", "value3");

        context.removeAttribute("test1");
    }
}
