package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.money.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




/*
 * Lớp làm việc trực tiếp với DB
 */

@Repository
public class EventDAOImpl implements EventDAO {

    @Autowired                //nhúng bean DriverManagerDataSource đã khởi tạo vào dataSource
    private DataSource dataSource;

    private Connection conn = null;
    private Statement statement = null;
    private PreparedStatement preStatement = null;
    private ResultSet result = null;


    /*
     *  Constant for table
     */


    @Override
    public Event findBy(int id) {
        Event wallet = new Event();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("select event_id, name, date, note, user_id, btn " +
                    "from event " +
                    "where event_id = ? ");
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            if (result.next()) {
                wallet.setId(result.getInt(1));
                wallet.setName(result.getString(2));
                wallet.setDate(result.getString(3));
                wallet.setNote(result.getString(4));
                wallet.setUser_id(result.getInt(5));
                wallet.setBtn(result.getString(6));
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
    public List<Event> findAll(int id, String start, String end) {
        List<Event> wallets = new ArrayList<Event>();
        String sql = "select event_id, name, date, note, user_id, btn " +
        "from event " +
                "where user_id = ? ";
        if(!start.equals("")){
            sql+= " and date >=" + start;
        }
        if(!end.equals("")){
            sql+= " and date <=" + end;
        }
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(sql);
            preStatement.setInt(1, id);
            result = preStatement.executeQuery();
            while (result.next()) {
                Event wallet = new Event();
                wallet.setId(result.getInt(1));
                wallet.setName(result.getString(2));
                wallet.setDate(result.getString(3));
                wallet.setNote(result.getString(4));
                wallet.setUser_id(result.getInt(5));
                wallet.setBtn(result.getString(6));
                wallets.add(wallet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return wallets;
    }


    public boolean saveEvent(Event wallet) {

        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("INSERT INTO event(name, date, user_id, note, btn)"
                    + " VALUES(?,?,?,?,?)");
            preStatement.setString(1, wallet.getName());
            preStatement.setString(2, wallet.getDate());
            preStatement.setInt(3, wallet.getUser_id());
            preStatement.setString(4, wallet.getNote());
            preStatement.setString(5, wallet.getBtn());
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
    public boolean deleteEvent(int id) {
        String delete = "DELETE FROM event where event_id = ?";

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
    public boolean updateEvent(Event wallet) {

        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("UPDATE event SET name = ?, date = ?, user_id = ?, note = ?, btn = ? where event_id = ?");
            preStatement.setString(1, wallet.getName());
            preStatement.setString(2, wallet.getDate());
            preStatement.setInt(3, wallet.getUser_id());
            preStatement.setString(4, wallet.getNote());
            preStatement.setString(5, wallet.getBtn());
            preStatement.setInt(6, wallet.getId());
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
}

