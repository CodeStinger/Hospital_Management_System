package com.entity;

public class Appointment {
	private int id;
	private int userid;
	private String fullname;
	private String gender;
	private int age;
	private String date;
	private String email;
	private String phone;
	private String disease;
	private String address;
	private String status;
	private int doctorid;

	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Appointment(int userid, String fullname, String gender, int age, String date, String email, String phone,
			String disease, String address, String status, int doctorid) {
		super();
		this.userid = userid;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.date = date;
		this.email = email;
		this.phone = phone;
		this.disease = disease;
		this.address = address;
		this.status = status;
		this.doctorid = doctorid;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}

	
}
