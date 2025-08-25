package com.ohgiraffers.solid.liskovsustitution.problem;

public class BadRectangle {
    private int width;
    private int height;

    public void setWidth(int width) {
        this.width = width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getArea() {return width * height;}
}
