package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userDAO {

	private Connection conn;

	public userDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean UserRegistration(User u) {
		boolean f = false;
		try {
			String sql = "INSERT INTO USER (fullname,email,password) VALUES (?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em, String psw) {
		User u = null;
		
		try {
			String sl = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sl);
			ps.setString(1,em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	public int getUserCount() {
		int i = 0;
		
		try {
			String sql = "SELECT count(id) FROM user";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				i = rs.getInt("count(id)");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
}
