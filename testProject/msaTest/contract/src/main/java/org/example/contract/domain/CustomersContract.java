package org.example.contract.domain;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "customers_contract")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomersContract {
    @Id
    private Long customerId;

    private String name;

    private String phone;

    private String email;
}
