package com.money.model;

import java.util.List;

public class Wallet {
    private int id;
    private String currency;
    private String name;
    private int user;
    private int initialbalance;
    private  String include;
    private int overbalnce;
    private int percent;



    public void setUser(int user) {
        this.user = user;
    }

    public int getOverbalnce() {
        return overbalnce;
    }

    public void setOverbalnce(int overbalnce) {
        this.overbalnce = overbalnce;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public Wallet(){}

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

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


    public int getInitialbalance() {
        return initialbalance;
    }

    public void setInitialbalance(int initialbalance) {
        this.initialbalance = initialbalance;
    }

    public String getInclude() {
        return include;
    }

    public void setInclude(String include) {
        this.include = include;
    }
}
