package com.ohgiraffers.springdatajpa.menu.service;

import com.ohgiraffers.springdatajpa.menu.controller.CategoryDTO;
import com.ohgiraffers.springdatajpa.menu.dto.MenuDTO;
import com.ohgiraffers.springdatajpa.menu.entity.Category;
import com.ohgiraffers.springdatajpa.menu.entity.Menu;
import com.ohgiraffers.springdatajpa.menu.repository.CategoryRepository;
import com.ohgiraffers.springdatajpa.menu.repository.MenuRepository;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class MenuService {

    private final MenuRepository menuRepository;
    private final ModelMapper modelMapper;

    private final CategoryRepository categoryRepository;

    @Autowired
    public MenuService(MenuRepository menuRepository
                        , ModelMapper modelMapper
                        , CategoryRepository categoryRepository) {
        this.menuRepository = menuRepository;
        this.modelMapper = modelMapper;
        this.categoryRepository = categoryRepository;
    }

    /* 설명. 1. findById(), Optional이 변환되는 점을 고려(get(), orElseXXX()) */
    public MenuDTO findMenuByCode(int menuCode) {

        Menu menu = menuRepository.findById(menuCode)
                                    .orElseThrow(IllegalArgumentException::new);
        log.debug("serivce계층에서 하나의 메뉴 상세보기: {}", menu);

        return modelMapper.map(menu, MenuDTO.class);
    }

    /* 설명. 2. findAll() (페이징 처리 전) */
    public List<MenuDTO> findMenuByList() {

        /* 설명. 내가 원하는 속성에 대한 정렬 가능(feat.Sort.by) */
        List<Menu> menus = menuRepository.findAll(Sort.by("menuCode").descending());
        log.debug("service계층에서 모든 메뉴보기: {}", menus);

        return menus.stream()
                .map(menu-> modelMapper.map(menu, MenuDTO.class))
                .collect(Collectors.toList());
    }

    /* 설명. 3. findAll() (페이징 처리 후) */
    public Page<MenuDTO> findMenuList(Pageable pageable) {
        /* 설명.
        *   넘어온 Pageable 객체를 커스터마이징
        *   1. page 값이 넘어오면 인덱스 개념으로 바꾼다.
        *   2. 한 페이지에 뿌릴 사이즈는 유지
        *   3. 정렬 기준을 내림차순으로 변경
        * */
        pageable = PageRequest.of(pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1,
                pageable.getPageSize(), Sort.by("menuCode").descending());
        Page<Menu> menuList = menuRepository.findAll(pageable);

        /* 설명. Page는 자체로 stream이다.*/
        return  menuList.map(menu -> modelMapper.map(menu, MenuDTO.class));
    }

    /* 설명. 4. jqpl 및 native query 활용*/
    public List<CategoryDTO> findAllCategory(){
        List<Category> categories = categoryRepository.findAllCategories();

        return categories.stream()
                .map(category -> modelMapper.map(category, CategoryDTO.class))
                .collect(Collectors.toList());


    }
    /* 설명. 5. insert 진행(Entity로 변환)*/
    @Transactional
    public void registMenu(MenuDTO newMenu) {
        menuRepository.save(modelMapper.map(newMenu, Menu.class));
    }

    /* 설명. 6. update 진행 */
    @Transactional
    public void modifyMenu(MenuDTO modifyMenu) {

        /* 설명. 수정할 메뉴를 가져와서(영속 상태로 만들어) 영속 상태만 객체를 수정하면 update */
        Menu foundMenu = menuRepository.findById(modifyMenu.getMenuCode()).get();
        foundMenu.setMenuName(modifyMenu.getMenuName());
    }

    /* 설명. 7. delete 진행 */
    @Transactional
    public void deleteMenu(int menuCode) {
        menuRepository.deleteById(menuCode);
    }

    public List<MenuDTO> findMenuPrice(int menuPrice){

        List<Menu> menus = menuRepository.findByMenuPriceGreaterThan(menuPrice);

        return menus.stream()
                .map(menu -> modelMapper.map(menu, MenuDTO.class))
                .collect(Collectors.toList());
    }

}
