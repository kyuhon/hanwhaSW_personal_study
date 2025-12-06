package org.example.contract.domain;

import lombok.Data;

@Data
public class CustomerCreatedEvent {
    private Long customerId;
    private String name;
    private String email;
    private String phone;
}
