package org.example.customer.controller;

import lombok.RequiredArgsConstructor;
import org.example.customer.domain.Customer;
import org.example.customer.domain.CustomerSelect;
import org.example.customer.service.CustomerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customers")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService service;

    @GetMapping
    public List<CustomerSelect> getAllCustomers() {
        return service.getAllCustomers();
    }

    @PostMapping
    public Customer create(@RequestBody Customer customer) {
        return service.create(customer);
    }
}
