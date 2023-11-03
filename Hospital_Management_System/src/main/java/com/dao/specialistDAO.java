package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;


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

	
	public List<Specialist> getSpecialists(){
		List<Specialist> specialists = new ArrayList<>();
		
		Specialist s = null;
		
		try {
			String sql = "SELECT * FROM specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s = new Specialist();
				
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				
				specialists.add(s);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return specialists;
	}
}
