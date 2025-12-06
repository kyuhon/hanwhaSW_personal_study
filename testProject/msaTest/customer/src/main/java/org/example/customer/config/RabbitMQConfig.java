package org.example.customer.config;

import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQConfig {

    // Exchange 이름
    public static final String CUSTOMER_EXCHANGE = "customer.exchange";

    // Queue 이름
    public static final String CUSTOMER_CREATED_QUEUE = "customer.created.queue";

    // Routing Key
    public static final String CUSTOMER_CREATED_ROUTING_KEY = "customer.created";

    // Direct Exchange 생성
    @Bean
    public DirectExchange customerExchange() {
        return new DirectExchange(CUSTOMER_EXCHANGE);
    }

    // Queue 생성
    @Bean
    public Queue customerCreatedQueue() {
        return new Queue(CUSTOMER_CREATED_QUEUE);
    }

    // Exchange ↔ Queue 바인딩
    @Bean
    public Binding bindingCustomerCreatedQueue() {
        return BindingBuilder.bind(customerCreatedQueue())
                .to(customerExchange())
                .with(CUSTOMER_CREATED_ROUTING_KEY);
    }

    // ⬇⬇⬇ JSON 메시지 변환기 추가 (중요!!)
    @Bean
    public Jackson2JsonMessageConverter jsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    // ⬇⬇⬇ RabbitTemplate에 JSON 변환기 적용
    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate template = new RabbitTemplate(connectionFactory);
        template.setMessageConverter(jsonMessageConverter());
        return template;
    }
}
