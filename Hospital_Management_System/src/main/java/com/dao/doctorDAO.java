package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class doctorDAO {
	private Connection conn;

	public doctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor d) {
		boolean b = false;
		try {
			String sql = "INSERT INTO doctor (fullname,dob,qualification,specialist,email,mobno,password) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMob());
			ps.setString(7, d.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {

				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> doctors = new ArrayList<>();

		Doctor d = null;
		try {
			String sql = "SELECT * FROM doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMob(rs.getString(7));
				d.setPassword(rs.getString(8));

				doctors.add(d);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctors;
	}

}
