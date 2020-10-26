package com.money.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.money.model.User;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private DataSource dataSource;
	
	private Connection conn = null;
	private PreparedStatement preStatament = null;
	private ResultSet result = null;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	private PreparedStatement preStatement = null;

	// Demo
	public boolean isExistsUser(User user) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT * FROM user WHERE user.username = ? OR user.email = ?");
			preStatament.setString(1, user.getUserName());
			preStatament.setString(2,  user.getEmail());
			result = preStatament.executeQuery();
			// Nếu đã tồn tại user
			if (result.next() == true) {
				return true;
			} else {
				return false;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return true;
		}
	}
	@Override
	public List<User> listUser(int id){
		List<User> users = new ArrayList<User>();
		try{
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT user.user_id,username, first_name, name, email, role, password " +
					"FROM user WHERE user.user_id != ?");
			preStatament.setInt(1, id);
			result = preStatament.executeQuery();
			System.out.println();
			while(result.next()) {
				User user = new User();
				user.setId(result.getInt(1));
				user.setUserName(result.getString(2));
				user.setFirstName(result.getString(3));
				user.setLastName(result.getString(4));
				user.setEmail(result.getString(5));
				user.setRole(result.getString(6));
				user.setPassword(result.getString(7));
				users.add(user);
			}
		} catch (SQLException e){
			return null;
		}
		return users;
	}

	/**
	 * Lưu người dùnng mới
	 */
	@Override
	public boolean saveUser(User user) {
		try {
		conn = dataSource.getConnection();
		String pass = passwordEncoder.encode(user.getPassword());
		preStatament = conn.prepareStatement("INSERT INTO user(username, password, first_name, name, email, role)"
				+ " VALUES (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
		preStatament.setString(1, user.getUserName());
		preStatament.setString(2, pass);
		preStatament.setString(3, user.getFirstName());
		preStatament.setString(4, user.getLastName());
		preStatament.setString(5, user.getEmail());
		preStatament.setString(6, user.getRole());
		// Xử lý và lấy id của user mới 
		int affected = preStatament.executeUpdate();
		// Nếu số dòng thêm vào là 1 ~ insert thành công
		if (affected == 1) {
			result = preStatament.getGeneratedKeys();
			result.next();
			// Get id của user vừa tạo
			int newID = result.getInt(1);
			System.out.println(newID);
			return true;
	
		} else {
			return false;
		}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		User user = new User();
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT user.user_id,username, first_name, name, email,  password, role FROM user WHERE user.user_id = ?");
			preStatament.setInt(1, id);
			
			result = preStatament.executeQuery();
			
			if(result.next()) {
				user.setId(result.getInt(1));
				user.setUserName(result.getString(2));
				user.setFirstName(result.getString(3));
				user.setLastName(result.getString(4));
				user.setEmail(result.getString(5));
				user.setPassword(result.getString(6));
				user.setRole(result.getString(7));
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return user;
	}

	@Override
	public int getIdByUserName(String username) {
		int userID = -1;
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT user_id FROM user WHERE username = ?");
			preStatament.setString(1, username);
			result = preStatament.executeQuery();
			
			if(result.next()) {
				userID = result.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}
		
		return userID;
	}

	@Override
	public boolean update(User user) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("UPDATE user SET first_name = ?, name = ?"
					+ " WHERE user_id=?");
			preStatament.setString(1, user.getFirstName());
			preStatament.setString(2, user.getLastName());
			preStatament.setInt(3, user.getId());
			preStatament.executeUpdate();

			return true;
		
		}catch(SQLException e ) {
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean updateUserAdmin(User user) {
		try {
			conn = dataSource.getConnection();
			String pass = passwordEncoder.encode(user.getPassword());
			preStatament = conn.prepareStatement("UPDATE user SET first_name = ?, name = ?, email= ?, username =?, password =?, role = ?"
					+ " WHERE id=?");
			preStatament.setString(1, user.getFirstName());
			preStatament.setString(2, user.getLastName());
			preStatament.setString(3, user.getEmail());
			preStatament.setString(4, user.getUserName());
			preStatament.setString(5, pass);
			preStatament.setString(6, user.getRole());
			preStatament.setInt(7, user.getId());

			return true;

		}catch(SQLException e ) {
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public String getPasswordByUserName(String name) {
		String password = null;
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT password FROM user WHERE username = ?");
			preStatament.setString(1, name);
			result = preStatament.executeQuery();
			
			if(result.next()) {
				password = result.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return password;
	}

	@Override
	public void updatePassword(String password, String name) {
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("UPDATE user SET password = ? WHERE username = ?");
			preStatament.setString(1, password);
			preStatament.setString(2, name);
			preStatament.executeUpdate();
	
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

//	@Override
//	public List<String> listRole() {
//		List<String> roles = new ArrayList<String>();
//		try {
//
//			conn = dataSource.getConnection();
//			preStatament = conn.prepareStatement("SELECT distinct role from user_role");
//			result = preStatament.executeQuery();
//			while (result.next()) {
//				String role;
//				role = result.getString(1);
//				roles.add(role);
//			}
//			return roles;
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return roles;
//	}
	@Override
	public boolean deleteUser(int id) {
		String delete = "DELETE FROM user where user_id = ?";

		try {
			conn = dataSource.getConnection();
			preStatement = conn.prepareStatement(delete);
			preStatement.setInt(1, id);
			if(preStatement.executeUpdate() > 0)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public User getUserByEmail(String  email) {
		User user = new User();
		try {
			conn = dataSource.getConnection();
			preStatament = conn.prepareStatement("SELECT user.user_id,username, first_name, name, email,  password, role FROM user WHERE email = ?");
			preStatament.setString(1, email);

			result = preStatament.executeQuery();

			if(result.next()) {
				user.setId(result.getInt(1));
				user.setUserName(result.getString(2));
				user.setFirstName(result.getString(3));
				user.setLastName(result.getString(4));
				user.setEmail(result.getString(5));
				user.setPassword(result.getString(6));
				user.setRole(result.getString(7));
			}
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}
}
