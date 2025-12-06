package org.example.customer.service;

import lombok.RequiredArgsConstructor;
import org.example.customer.config.RabbitMQConfig;
import org.example.customer.domain.Customer;
import org.example.customer.domain.CustomerCreatedEvent;
import org.example.customer.domain.CustomerSelect;
import org.example.customer.mapper.CustomerMapper;
import org.example.customer.repository.CustomerRepository;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerRepository repository;
    // 자동으로 Customer를 JSON으로 변환해서 publish한다.
    private final RabbitTemplate rabbitTemplate;
    private final CustomerMapper customerMapper;

    public Customer create(Customer customer) {

        // 1) DB 저장
        Customer saved = repository.save(customer);

        // 2) 이벤트 DTO 생성
        CustomerCreatedEvent event = new CustomerCreatedEvent();
        event.setCustomerId(saved.getCustomerId());
        event.setName(saved.getName());
        event.setEmail(saved.getEmail());
        event.setPhone(saved.getPhone());

        // 3) RabbitMQ 이벤트 발행
        rabbitTemplate.convertAndSend(
                RabbitMQConfig.CUSTOMER_EXCHANGE,
                RabbitMQConfig.CUSTOMER_CREATED_ROUTING_KEY,
                event
        );

        System.out.println("[RabbitMQ] CustomerCreatedEvent 발행됨 => " + event);

        return saved;
    }

    public List<CustomerSelect> getAllCustomers() {
        return customerMapper.findAll();
    }
}
