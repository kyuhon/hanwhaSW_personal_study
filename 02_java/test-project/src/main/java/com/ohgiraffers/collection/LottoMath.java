package com.ohgiraffers.collection;

import java.util.Set;
import java.util.TreeSet;

public class LottoMath {
    public static void main(String[] args) {
        Set<Integer> lotto = new TreeSet<>();
        while(lotto.size() < 6){
            lotto.add((int)(Math.random() * 45)+1);
        }
        System.out.println("lotto = " + lotto);

//        배열을 활용해서 같은 로또번호 발생
        int[] arr = new int[6];

    }

}
