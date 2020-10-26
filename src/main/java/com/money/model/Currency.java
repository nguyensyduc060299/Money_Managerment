package com.money.model;

public class Currency {
    private int id;
    private String name;
    private String viettat;
    
    public Currency(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getViettat() {
        return viettat;
    }

    public void setViettat(String viettat) {
        this.viettat = viettat;
    }
}
