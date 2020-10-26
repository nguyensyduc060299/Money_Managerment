package com.money.dao;

import com.money.model.Currency;

import java.util.List;

public interface CurrencyDAO {
    List<Currency> findAll();
}
