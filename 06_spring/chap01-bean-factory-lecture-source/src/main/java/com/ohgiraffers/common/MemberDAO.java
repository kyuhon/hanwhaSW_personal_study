package com.ohgiraffers.common;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MemberDAO {
    public MemberDAO() {
        System.out.println("콩 될 때 이거 쓰나?");
    }
}
