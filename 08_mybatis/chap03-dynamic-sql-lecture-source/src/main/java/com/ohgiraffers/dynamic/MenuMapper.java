package com.ohgiraffers.dynamic;

import java.util.List;

public interface MenuMapper {
    List<MenuDTO> selectMenuByPrice(int maxPrice);

    List<MenuDTO> searchMenu(SearchCriteria searchCriteria);

    List<MenuDTO> searchMenuBySubCategory(SearchCriteria searchCriteria);
}
