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
import com.money.model.Category;

@Repository
public class  CategoryDAOImpl implements CategoryDAO{
	@Autowired
	private DataSource dataSource;
	private Connection conn = null;
	private ResultSet result = null;
	private PreparedStatement preStatement = null;
	
	@Override
	public boolean add(Category category) {
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("INSERT INTO category(name) VALUES(?)", Statement.RETURN_GENERATED_KEYS);
			preStatement.setString(1, category.getName());

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
	public Category findBy(int categoryId) {
		Category category = new Category();
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT category_id, name FROM category WHERE category_id = ?");
			preStatement.setInt(1, categoryId);
			result = preStatement.executeQuery();
			if (result.next()) {
				category.setId(result.getInt(1));
				category.setName(result.getString(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return category;
	}
	
	// Tìm kiếm theo tên, nếu chưa có thì thêm vào 
	public Category findBy(String categoryName) {
		Category category = new Category();
		category.setName(categoryName);
		try {
			// Lấy id category
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("SELECT * FROM category WHERE name = ?");
			preStatement.setString(1, categoryName);
			result = preStatement.executeQuery();
			if (result.next()) {
				category.setId(result.getInt(1));
			} 
			// Nếu chưa tồn tại thì thêm vào
			else {
					return null;
			}
		} catch(SQLException e ) {
			e.printStackTrace();
			return null;
		}
		return category;
		

	}
	
	@Override
	public List<Category> findAll(){
		List<Category> list = new ArrayList<Category>();
		String select = "SELECT * FROM category";
		try {
			
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(select);
			result = preStatement.executeQuery();
			while(result.next()) {
				Category category = new Category();
				category.setId(result.getInt(1));
				category.setName(result.getString(2));
				list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public boolean deleteCategory(int categoryId) {

		String delete = "DELETE FROM category WHERE id = ?";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement("UPDATE book SET category_id = 4 where book.category_id ="+categoryId);
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
	public boolean updateCategory(Category category) {
		String update = "UPDATE category SET name = ? WHERE category_id = ?";
		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(update);
			preStatement.setString(1, category.getName());
			preStatement.setInt(2, category.getId());
			if(preStatement.executeUpdate() > 0) 
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	

	
}
