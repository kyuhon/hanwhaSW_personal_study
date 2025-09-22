package com.ohgiraffers.algorithm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.stream.IntStream;

/* 버블 정렬*/
public class Application2 {
    public static void main(String[] args) {

//      입력 데이터 받기
//        Scanner sc = new Scanner(System.in);
//        int length = sc.nextInt();
//        int[] arr = new int[length];
//        for(int i = 0; i < length; i++){
//            arr[i] = sc.nextInt();
//        }
//
//        System.out.println(length);
//        System.out.println(Arrays.toString(arr));

        /* BufferedReader를 활용하는 방법*/
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            int length = Integer.parseInt(br.readLine());
            // 가급적 한줄을 문자열로 읽어 숫자로 바꿀 때는 Integer.valueOf 대신 Integer.parseInt 사용

            /* 한줄 문자열 파싱하기 */
            /* split 활용(정규표현식 해석으로 인해 StringTokenizer보다 시간이 약간 더 걸림)*/

//            String[] strArr = br.readLine().split(" ");
//            int[] arr = new int[length];
//            for (int i = 0; i < strArr.length; i++) {
//                arr[i] = Integer.parseInt(strArr[i]);
//            }

            /* StringTokenizer 활용*/
//            StringTokenizer st = new StringTokenizer(br.readLine());
//            int[] arr = new int[length];
//            int index = 0;
//            while(st.hasMoreTokens()){
//                arr[index] = Integer.parseInt(st.nextToken());
//                index++;
//            }
            /* Stream 활용*/
            IntStream intStream = Arrays.stream(br.readLine().split(" "))
                    .mapToInt(x -> Integer.parseInt(x));
            int[] arr = intStream.toArray();
            solution(length, arr);
            System.out.println(length);
            System.out.println(Arrays.toString(arr));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    /*넘어온 데이터를 가지고 버블 정렬 알고리즘 작성 시작*/
    private static void solution(int length, int[] arr) {
        for(int i = 0; i < length; i++){
            System.out.println((i+1) + "번째 순회: " + Arrays.toString(arr));

            /* 둘씩 쌍을 지어 하나의 버블을 끝까지 한번 보내는 작업*/
            for(int j = 0; j < length - 1; j++){
                if(arr[j] > arr[j + 1]){            //오름차순을 위해 오른쪽이 적으면 swap

                    /* 두 요소 (j,j+1)의 위치를 swap*/
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
}
