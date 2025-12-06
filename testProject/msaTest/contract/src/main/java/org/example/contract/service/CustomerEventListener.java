package org.example.contract.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.example.contract.config.RabbitMQConfig;
import org.example.contract.domain.CustomersContract;
import org.example.contract.domain.CustomerCreatedEvent;
import org.example.contract.repository.CustomersContractRepository;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomerEventListener {

    private final CustomersContractRepository customersContractRepository;

    @RabbitListener(queues = RabbitMQConfig.CUSTOMER_CREATED_QUEUE)
    public void onCustomerCreated(CustomerCreatedEvent event) throws Exception {

        System.out.println("[ContractService] CustomerCreatedEvent 수신: " + event);


        // DTO → 엔티티 변환
        CustomersContract snapshot = CustomersContract.builder()
                .customerId(event.getCustomerId())
                .name(event.getName())
                .email(event.getEmail())
                .phone(event.getPhone())
                .build();

        // DB 저장
        customersContractRepository.save(snapshot);

        System.out.println("💾 고객 스냅샷 저장 완료: " + snapshot.getCustomerId());
    }
}
