package org.example.contract.controller;

import lombok.RequiredArgsConstructor;
import org.example.contract.domain.Contracts;
import org.example.contract.service.ContractService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/contracts")
@RequiredArgsConstructor
public class ContractController {

    private final ContractService service;

    @PostMapping
    public Contracts create(@RequestBody Contracts contract) {
        return service.create(contract);
    }
}
