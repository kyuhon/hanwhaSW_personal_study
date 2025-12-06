package org.example.contract.config;

import org.springframework.amqp.core.Queue;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQConfig {

    // Customer 서비스에서 만든 Exchange/Queue와 동일해야 함
    public static final String CUSTOMER_CREATED_QUEUE = "customer.created.queue";

    // Queue 등록
    @Bean
    public Queue customerCreatedQueue() {
        return new Queue(CUSTOMER_CREATED_QUEUE);
    }

    // 🔥 JSON 메시지 → DTO 변환해주는 컨버터
    @Bean
    public Jackson2JsonMessageConverter jsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }
}
