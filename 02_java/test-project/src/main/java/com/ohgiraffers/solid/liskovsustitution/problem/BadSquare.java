package com.ohgiraffers.solid.liskovsustitution.problem;

public class BadSquare extends BadRectangle{

    @Override
    public void setWidth(int width) {
        super.setWidth(width);
        super.setHeight(width);
    }
    @Override
    public void setHeight(int height) {
        super.setHeight(height);
        super.setWidth(height);
    }
}
