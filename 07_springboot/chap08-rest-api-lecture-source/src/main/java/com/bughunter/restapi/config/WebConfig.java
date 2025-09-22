package com.bughunter.restapi.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/* 설명. WebMvc 설정을 통한 정적 리소스 핸들러 등록 방식 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/response/image/**")
                .addResourceLocations("file:C:/Users/Playdata/Desktop/Personal_study/image/");
    }
}
