package com.entity;

public class Admin {
	private int id;
	private String name;
	private String gender;
	private String address;
	private String dob;
	private String phNo;
	private String email;
	private String pass;
	
	public Admin() {
		super();
	}
	
	public Admin(int id, String name, String address, String dob, String gender, String phNo, String email, String pass) {
		super();
		this.id = id;
        this.name = name;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phNo = phNo;
        this.email = email;
        this.pass = pass;
    }
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPhNo() {
		return phNo;
	}
	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
