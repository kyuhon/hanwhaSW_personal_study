package com.ohgiraffers.filter.section01;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter(filterName = "firstFilter", urlPatterns = "/first/*")
public class FirstFilter implements Filter {
    public FirstFilter() {
        System.out.println("Filter 기본생성자 호출!");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter 인스턴스 생성!");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("FirstFilter의 doFilter() 호출 됨...");
        System.out.println("First서블릿 다녀오기 이전");
        //FilterChain에서 제공하는 doFilter() 호출
        chain.doFilter(request, response);
        System.out.println("First서블릿 다녀온 이후 client로 응답 전");
        //filter 처리하기 전후로 처리되는 부분을 코드처리할수있음
    }

    @Override
    public void destroy() {
        System.out.println("FirstFilter 삭제 직전!");
    }
}
    
