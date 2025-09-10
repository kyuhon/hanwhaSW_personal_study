package com.ohgiraffers.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.util.Locale;

@Component
public class StopwatchInterceptor implements HandlerInterceptor {

    InterceptorTestService testService;

    @Autowired
    public StopwatchInterceptor(InterceptorTestService testService) {
        this.testService = testService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("preHandler 호출함...(핸들러 메소드 이전)");

        /* 설명. 스탑워치 기능 */
        long startTime = System.currentTimeMillis();    // 시스템의 현재 시간을 밀리초 단위 long형으로 변환
        request.setAttribute("startTime", startTime);

        /* 설명. 사용자의 로케일 추출 */
        Locale locale = request.getLocale();
        System.out.println("locale = " + locale);
        if("ko_KR".equals(locale)) System.out.println("한국인이시군요");
        /* 설명. Service bean 활용(메소드 호출) */
        testService.test();

        /* 설명. 핸들러 인터셉터의 preHandler가 반환하는 boolean형에 따라 Controller의 핸들러 메소드 동작여부 조절 가능*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandler 호출함...(핸들러 메소드 이후)");
        long startTime = (Long)request.getAttribute("startTime");
        long endTime = System.currentTimeMillis();
        /* 설명. postHandle의 ModelAndView는 Controller의 핸들러 메소드가 변환한 내용(재료) + 뷰가 담겨있다. */
        modelAndView.addObject("interval", endTime - startTime);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
