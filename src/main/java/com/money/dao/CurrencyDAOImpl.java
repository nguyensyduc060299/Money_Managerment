package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.money.model.Currency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class CurrencyDAOImpl implements CurrencyDAO{
    @Autowired
    private DataSource dataSource;
    private Connection conn = null;
    private ResultSet result = null;
    private PreparedStatement preStatement = null;

    @Override
    public List<Currency> findAll(){
        List<Currency> list = new ArrayList<Currency>();
        String select = "SELECT * FROM currency";
        try {

            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(select);
            result = preStatement.executeQuery();
            while(result.next()) {
                Currency currency = new Currency();
                currency.setId(result.getInt(1));
                currency.setName(result.getString(2));
                currency.setViettat(result.getString(3));
                list.add(currency);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
