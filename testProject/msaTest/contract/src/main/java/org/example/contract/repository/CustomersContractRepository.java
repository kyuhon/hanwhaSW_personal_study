package org.example.contract.repository;

import org.example.contract.domain.CustomersContract;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomersContractRepository extends JpaRepository<CustomersContract, Long> {
}