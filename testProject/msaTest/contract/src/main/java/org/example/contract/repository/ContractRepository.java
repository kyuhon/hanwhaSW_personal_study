package org.example.contract.repository;

import org.example.contract.domain.Contracts;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContractRepository extends JpaRepository<Contracts, Long> {
}
