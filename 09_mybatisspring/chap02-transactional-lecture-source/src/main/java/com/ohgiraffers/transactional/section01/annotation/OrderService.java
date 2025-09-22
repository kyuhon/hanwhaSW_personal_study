package com.ohgiraffers.transactional.section01.annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class OrderService {

    private final OrderMapper orderMapper;
    private final MenuMapper menuMapper;

    @Autowired
    public OrderService(OrderMapper orderMapper, MenuMapper menuMapper) {
        this.orderMapper = orderMapper;
        this.menuMapper = menuMapper;
    }

    @Transactional
    public void registNewOrder(OrderDTO orderInfo){

        /* 설명. 1. 주문한 메뉴들의 코드만 추출(DTO 에서) */
//        List<Integer> menuCodes = new ArrayList<>();
//        List<OrderMenuDTO> orderMenus = orderInfo.getOrderMenus();
//        for (OrderMenuDTO orderMenu : orderMenus) {
//            menuCodes.add(orderMenu.getMenuCode());
//        }
        List<Integer> menuCodes = orderInfo.getOrderMenus()
                .stream()
//                .map(orderMenu -> orderMenu.getMenuCode())
                .map(OrderMenuDTO::getMenuCode)
                .collect(Collectors.toList());

        Map<String, List<Integer>> map = new HashMap<>();
        map.put("menuCodes", menuCodes);

        /* 설명. 2. 주문한 메뉴별로 Menu엔티티에 담아서 조회(select)해 오기(부가적인 메뉴의 정보 추출(단가)) */
        List<Menu> menus = menuMapper.selectMenuByMenuCodes(map);
//        menus.forEach(System.out::println);

        /* 설명. 3. 이 주문건에 대한 총 합계를 계산 */
        int totalOrderPrice = calcTotalPrice(orderInfo.getOrderMenus(), menus);
        
        /* 설명. 4. 1부터 3까지 해서 tbl_order 테이블에 추가(insert) */

        /* 설명. 4-1. OrderDTO -> Order */
        Order order = new Order();

        /* 설명. 4-2. Order로 tbl_order 테이블에 insert */
        orderMapper.insertOrder(order);
        System.out.println("주문 성공 후 방금 주문한 번호가 Order 엔티티에 들어있는지 확인: " + order.getOrderCode());

        /* 설명. 5. tbl_order_menu 테이블에도 주문한 메뉴 갯수만큼 메뉴를 추가(insert) */
        List<OrderMenuDTO> orderMenuDTO = orderInfo.getOrderMenus();
        for(OrderMenuDTO menuDTO : orderMenuDTO){
            orderMapper.
        }

    }

    /* 설명. 사용자가 주문한 각 메뉴와 수량에 따른 총 주문금액 계산용 메소드 */
    private int calcTotalPrice(List<OrderMenuDTO> orderMenus, List<Menu> menus) {
        int totalPrice = 0;
        
        int orderMenuSize = orderMenus.size();              // 사용자가 주문한 메뉴의 종류
        for (int i = 0; i < orderMenuSize; i++) {           // 사용자가 주문한 메뉴의 종류만큼 반복
            OrderMenuDTO orderMenu = orderMenus.get(i);     // 메뉴 수량 추출을 위해
            Menu menu = menus.get(i);                       // 메뉴 단가 추출을 위해
            totalPrice += orderMenu.getOrderAmount() * menu.getMenuPrice();
        }
        
        return totalPrice;
    }
}
