package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.money.model.FeedBack;

@Repository
public class  FeedBackDAOImpl implements FeedBackDAO{
    @Autowired
    private DataSource dataSource;
    private Connection conn = null;
    private ResultSet result = null;
    private PreparedStatement preStatement = null;

    @Override
    public boolean addFeedBack(FeedBack feedBack) {
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("INSERT INTO contact(user_id, title, content) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
            preStatement.setInt(1, feedBack.getUser_id());
            preStatement.setString(2, feedBack.getTitle());
            preStatement.setString(3, feedBack.getContent());
            int affected  = preStatement.executeUpdate();
            if (affected == 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public FeedBack findBy(int categoryId) {
        FeedBack category = new FeedBack();
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement("SELECT contact_id, user_id, title, content FROM contact WHERE contact_id = ?");
            preStatement.setInt(1, categoryId);
            result = preStatement.executeQuery();
            if (result.next()) {
                category.setId(result.getInt(1));
                category.setUser_id(result.getInt(2));
                category.setTitle(result.getString(3));
                category.setContent(result.getString(4));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return category;
    }

    @Override
    public List<FeedBack> findAll(){
        List<FeedBack> list = new ArrayList<FeedBack>();
        String select = "SELECT * FROM contact";
        try {

            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(select);
            result = preStatement.executeQuery();
            while(result.next()) {
                FeedBack category = new FeedBack();
                category.setId(result.getInt(1));
                category.setUser_id(result.getInt(2));
                category.setTitle(result.getString(3));
                category.setContent(result.getString(4));
                list.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean deleteFeedBack(int categoryId) {

        String delete = "DELETE FROM contact WHERE id = ?";
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(delete);
            preStatement.setInt(1, categoryId);
            if(preStatement.executeUpdate() > 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateFeedBack(FeedBack category) {
        String update = "UPDATE contact SET user_id = ?, title = ?, content =? WHERE contact_id = ?";
        try {
            conn = dataSource.getConnection();
            preStatement = conn.prepareStatement(update);
            preStatement.setString(2, category.getTitle());
            preStatement.setInt(1, category.getUser_id());
            preStatement.setString(3, category.getContent());
            if(preStatement.executeUpdate() > 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



}
