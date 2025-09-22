package com.ohgiraffers.section01.app;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@ComponentScan(basePackages = "com.ohgiraffers.section01.app")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ContextConfiguration {

}
