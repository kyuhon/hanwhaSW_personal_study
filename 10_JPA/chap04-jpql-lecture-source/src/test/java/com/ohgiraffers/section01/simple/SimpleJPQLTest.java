package com.ohgiraffers.section01.simple;

import jakarta.persistence.*;
import org.junit.jupiter.api.*;

import java.util.Arrays;
import java.util.List;

public class SimpleJPQLTest {
    private static EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;

    @BeforeAll
    public static void initFactory(){
        entityManagerFactory = Persistence.createEntityManagerFactory("jpatest");
    }

    @BeforeEach
    public void initManager(){

        /* 설명. EntityManager가 생성될 때마다 고유의 새로운 영속성 컨텍스트(Entity 객체를 관리하는 창고)가 생성된다. */
        entityManager = entityManagerFactory.createEntityManager();
    }

    @AfterEach
    public void closeManager(){
        entityManager.close();
    }

    @AfterAll
    public static void closeFactory(){
        entityManagerFactory.close();
    }

    @Test
    public void TypeQuery를_이용한_단일행_단일열_조회_테스트(){
        String jpql = "SELECT m.menuName FROM menu_section01 m where m.menuCode = 7";

        /* 설명. 조회 결과 반환되는 값을 알고 있을 때는 TypedQuery를 활용하며 단일행인지
        *   다중행인지 구분해서 사용 */
        TypedQuery<String> query = entityManager.createQuery(jpql, String.class);
        String resultMenuName = query.getSingleResult();        // 결과가 단일행임을 알고 getSingleResult() 호출
        System.out.println("resultMenuName: " + resultMenuName);

        Assertions.assertEquals("민트미역국", resultMenuName);

    }

    @Test
    public void Query를_이용한_단일행_단일열_조회_테스트(){
//        String jpql = "SELECT m.menuName FROM menu_section01 m WHERE m.menuCode = 7";
//        Query query = entityManager.createQuery(jpql);
//        Object resultMenuName = query.getSingleResult();
//        System.out.println("resultMenuName: " + resultMenuName);
//
//        Assertions.assertTrue(resultMenuName instanceof String);
//        Assertions.assertEquals("민트미역국",resultMenuName);

        /* 설명. 일부 속성만 추출하는 Projection의 하나의 경우만 테스트 */
        /* 설명. 단일행 일부 다중열(Object[]일 시)(feat. 전체 속성(컬럼) 또는 단일 속성(컬럼)이 아닌 경우)*/
        String jqpl = "SELECT m.menuName, m.menuPrice FROM menu_section01 m WHERE m.menuCode = 7";
        Query query = entityManager.createQuery(jqpl);
        List<Object[]> resultColumns = query.getResultList();

        Object[] resultRow = resultColumns.get(0);
        Arrays.stream(resultRow).forEach(System.out::println);

        Assertions.assertTrue(resultRow[0] instanceof String);
        Assertions.assertTrue(resultRow[1] instanceof Integer);
    }

    @Test
    public void TypedQuery를_이용한_다중행_다중열_조회_테스트(){
        String jqpl = "SELECT m FROM menu_section01 m";
        TypedQuery<Menu> query = entityManager.createQuery(jqpl, Menu.class);

        List<Menu> foundMenuList = query.getResultList();
        foundMenuList.forEach(System.out::println);

        Assertions.assertTrue(foundMenuList.isEmpty());
    }

    @Test
    public void distinct를_활용한_중복제거_여러_행_조회_테스트(){
        String jqpl = "SELECT distinct m.categoryCode FROM menu_section01 m";
        TypedQuery<Integer> query = entityManager.createQuery(jqpl, Integer.class);

        List<Integer> foundMenuList = query.getResultList();
        foundMenuList.forEach(System.out::println);

        Assertions.assertTrue(!foundMenuList.isEmpty());
    }

    @Test
    public void in_연산자를_활용한_조회_테스트(){
        String jqpl = "SELECT m FROM menu_section01 m WHERE m.categoryCode IN (6,10)";
        List<Menu> foundMenuList = entityManager.createQuery(jqpl, Menu.class).getResultList();
        foundMenuList.forEach(System.out::println);

        Assertions.assertTrue(foundMenuList.isEmpty());
    }

    @Test
    public void like_연산자를_활용한_조회_테스트(){
        String jqpl = "SELECT m FROM menu_section01 m WHERE m.menuName LIKE '%마늘%'";
        List<Menu> foundMenuList = entityManager.createQuery(jqpl, Menu.class).getResultList();
        foundMenuList.forEach(System.out::println);

        Assertions.assertTrue(foundMenuList.isEmpty());
    }

}
