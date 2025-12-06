package org.example.contract.service;

import lombok.RequiredArgsConstructor;
import org.example.contract.domain.Contracts;
import org.example.contract.repository.ContractRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ContractService {

    private final ContractRepository repository;

    public Contracts create(Contracts contract) {
        return repository.save(contract);
    }
}
