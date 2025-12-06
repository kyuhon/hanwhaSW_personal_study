package org.example.customer.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.customer.domain.CustomerSelect;

import java.util.List;

@Mapper
public interface CustomerMapper {
    List<CustomerSelect> findAll();
}
