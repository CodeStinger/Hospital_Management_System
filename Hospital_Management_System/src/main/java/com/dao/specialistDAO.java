package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class specialistDAO {
	private Connection conn;

	public specialistDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addSpecialist(String name) {
		boolean f = false;

		try {
			String sql = "INSERT INTO specialist (name) VALUE (?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
