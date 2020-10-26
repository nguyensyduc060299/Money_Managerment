package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.money.model.Wallet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.money.model.Category;

/*
 * Lớp làm việc trực tiếp với DB
 */

@Repository
public class WalletDAOImpl implements WalletDAO {

    @Autowired                //nhúng bean DriverManagerDataSource đã khởi tạo vào dataSource
    private DataSource dataSource;
    @Autowired
    private CategoryDAO categoryDAO;

    private Connection conn = null;
    private Statement statement = null;
    private PreparedStatement preStatement = null;
    private ResultSet result = null;


    /*
     *  Constant for table
     */


    @Override
    public Wallet findBy(int wallet_id) {
        Wallet wallet = new Wallet();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("select wallet_id, c.name, w.name, u.user_id, initialbalance " +
                    "from wallets as w, currency as c, user as u " +
                    "where w.wallet_id = ? and c.currency_id = w.currency_id and u.user_id = w.user_id");
            preStatement.setInt(1, wallet_id);
            result = preStatement.executeQuery();
            if (result.next()) {
                wallet.setId(result.getInt(1));
                wallet.setCurrency(result.getString(2));
                wallet.setName(result.getString(3));
                wallet.setUser(result.getInt(4));
                wallet.setInitialbalance(result.getInt(5));
                return wallet;
            } else {
                return null;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    @Override
    public List<Wallet> findAll(int id) {
        List<Wallet> wallets = new ArrayList<Wallet>();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("select wallet_id, c.name, w.name, initialbalance " +
                    "from money_lover.wallets as w, money_lover.currency as c " +
                    "where  w.user_id = ? and c.currency_id = w.currency_id");
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            while (result.next()) {
                Wallet wallet = new Wallet();
                wallet.setId(result.getInt(1));
                wallet.setCurrency(result.getString(2));
                wallet.setName(result.getString(3));
                wallet.setUser(id);
                wallet.setInitialbalance(result.getInt(4));
                wallets.add(wallet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return wallets;
    }

    @Override
    public boolean saveWallet(Wallet wallet) {

        try {
            conn = dataSource.getConnection();

            int currency_id = getId("currency", wallet.getCurrency());

            preStatement = conn.prepareStatement("INSERT INTO wallets(name, currency_id, user_id, initialbalance)"
                    + " VALUES(?,?,?,?)");
            preStatement.setString(1, wallet.getName());
            preStatement.setInt(2, currency_id);
            preStatement.setInt(3, wallet.getUser());
            preStatement.setInt(4, wallet.getInitialbalance());
            int affected = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteWallet(int id) {
        String delete = "DELETE FROM wallets where wallet_id = ?";

        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(delete);
            preStatement.setInt(1, id);
            if (preStatement.executeUpdate() > 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateWallet(Wallet wallet) {

        String update = "UPDATE waller SET name = ?,author = ?,publisher_id = ?,category_id = ?,image = ?,total = ?,price = ?,year = ?,"
                + "description = ?"
                + " WHERE id = ?";
        try {
            conn = dataSource.getConnection();

            int currency_id = getId("currency", wallet.getCurrency());

            preStatement = conn.prepareStatement("UPDATE wallets SET name = ?, currency_id = ?, user_id = ?, initialbalance = ? where wallet_id = ?");
            preStatement.setString(1, wallet.getName());
            preStatement.setInt(2, currency_id);
            preStatement.setInt(3, wallet.getUser());
            preStatement.setInt(4, wallet.getInitialbalance());
            preStatement.setInt(5, wallet.getId());
            int affected = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public int getId(String nameTable, String str) {
        int id = -1;
        String select = "SELECT * FROM " + nameTable;
        String insert = "INSERT INTO " + nameTable + "(name) VALUES(?)";
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(select);
            result = preStatement.executeQuery();
            while (result.next()) {
                if (result.getString(2).equals(str))
                    id = result.getInt(1);
            }
            if (id == -1) {
                preStatement = conn.prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
                preStatement.setString(1, str);
                preStatement.execute();
                result = preStatement.getGeneratedKeys();
                while (result.next()) {
                    id = result.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;

    }
    @Override
    public boolean updateShare(int id, int user){
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("INSERT IGNORE INTO wallet_user(wallet_id, user_id)"
                    + " VALUES(?,?)");

            preStatement.setInt(1, id);
            preStatement.setInt(2, user);
            System.out.println(id);
            int affected = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }


        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public List<Wallet> listWalletShare(int id) {
        List<Wallet> wallets = new ArrayList<Wallet>();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("select w.wallet_id, c.name, w.name, initialbalance, w.user_id " +
                    "from money_lover.wallets as w, money_lover.currency as c , wallet_user as wu " +
                    "where  wu.user_id = ? and c.currency_id = w.currency_id and w.wallet_id = wu.wallet_id");
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            while (result.next()) {
                Wallet wallet = new Wallet();
                wallet.setId(result.getInt(1));
                wallet.setCurrency(result.getString(2));
                wallet.setName(result.getString(3));
                wallet.setInitialbalance(result.getInt(4));
                wallet.setUser(result.getInt(5));
                wallets.add(wallet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return wallets;
    }
//    @Override
//    public List<Integer> listUser(int id){
//        List<Integer> wallets = new ArrayList<Integer>();
//        try {
//            conn = dataSource.getConnection();
//            preStatement = conn.prepareStatement("select user_id from wallet_user where wallet_id = ?");
//            preStatement.setInt(1, id);
//            result = preStatement.executeQuery();
//            while (result.next()) {
//                Integer wallet;
//                wallet = result.getInt(1);
//                wallets.add(wallet);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return null;
//        }
//
//        return wallets;
//    }
}

