package com.ohgiraffers.dynamic;

public class SearchCriteria {
    private String condition;   // 검색 조건
    private String value;       // 검색어

    public SearchCriteria() {
    }

    public SearchCriteria(String condition, String value) {}

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
