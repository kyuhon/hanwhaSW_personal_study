package org.example.contract.domain;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "contracts")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Contracts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long contractId;

    private Long customerId;

    private String productName;

    private int price;
}
