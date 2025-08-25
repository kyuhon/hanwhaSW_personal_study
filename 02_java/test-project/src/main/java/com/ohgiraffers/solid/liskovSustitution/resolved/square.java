package com.ohgiraffers.solid.liskovSustitution.resolved;

public class square implements Shape {
    private int side;

    public square(int side) {
        this.side = side;
    }
    @Override
    public int getArea() {
        // return side * side;
        return (int)Math.pow(side, 2);
    }
}
