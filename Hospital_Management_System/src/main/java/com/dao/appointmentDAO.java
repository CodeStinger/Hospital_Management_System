package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class appointmentDAO {
	private Connection conn;

	public appointmentDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {
		boolean f = false;
		try {
			String sql = "INSERT INTO appointment (userid,fullname,gender,age,date,email,phone,disease,address,status,doctorid)"
					+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserid());
			ps.setString(2, ap.getFullname());
			ps.setString(3, ap.getGender());
			ps.setInt(4, ap.getAge());
			ps.setString(5, ap.getDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhone());
			ps.setString(8, ap.getDisease());
			ps.setString(9, ap.getAddress());
			ps.setString(10, ap.getStatus());
			ps.setInt(11, ap.getDoctorid());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public List<Appointment> getAllAppointmentOfUser(int uid){
		
		List<Appointment> list= new ArrayList<>();
		
		Appointment ap = null;
		
		try {
			String sql = "SELECT * FROM appointment WHERE userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
		
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getInt(5));
				ap.setDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhone(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setAddress(rs.getString(10));
				ap.setStatus(rs.getString(11));
				ap.setDoctorid(rs.getInt(12));
				list.add(ap);
							}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
public List<Appointment> getAllAppointmentsOfDoctor(int doctorid){
		
		List<Appointment> list= new ArrayList<>();
		
		Appointment ap = null;
		
		try {
			String sql = "SELECT * FROM appointment WHERE doctorid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorid);
			ResultSet rs = ps.executeQuery();
		
			while(rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getInt(5));
				ap.setDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhone(rs.getString(8));
				ap.setDisease(rs.getString(9));
				ap.setAddress(rs.getString(10));
				ap.setStatus(rs.getString(11));
				ap.setDoctorid(rs.getInt(12));
				list.add(ap);
							}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

public Appointment getAppointmentById(int id){
	
	Appointment ap = null;
	
	try {
		String sql = "SELECT * FROM appointment WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
	
		while(rs.next()) {
			ap = new Appointment();
			ap.setId(rs.getInt(1));
			ap.setUserid(rs.getInt(2));
			ap.setFullname(rs.getString(3));
			ap.setGender(rs.getString(4));
			ap.setAge(rs.getInt(5));
			ap.setDate(rs.getString(6));
			ap.setEmail(rs.getString(7));
			ap.setPhone(rs.getString(8));
			ap.setDisease(rs.getString(9));
			ap.setAddress(rs.getString(10));
			ap.setStatus(rs.getString(11));
			ap.setDoctorid(rs.getInt(12));
			
						}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	return ap;
}
}
