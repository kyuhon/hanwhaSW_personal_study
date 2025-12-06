package org.example.customer.domain;

import lombok.Data;

@Data
public class CustomerSelect {
    private Long customerId;
    private String name;
    private String email;
    private String phone;
}
