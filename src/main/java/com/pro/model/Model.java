package com.pro.model;

public class Model {

	private int id;
	private String fname;
	private String lname;
	private String email;
	private String mobile;
	private String password;
	private String address;
	private String city;
	private String state;
	private String zip;
	
	public Model(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
		
	public Model(String fname, String lname, String email, String mobile, String password, String address, String city,
			String state, String zip) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	public int getId() {
		return id;
	}

	public String getFname() {
		return fname;
	}

	public String getLname() {
		return lname;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public String getPassword() {
		return password;
	}

	public String getAddress() {
		return address;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getZip() {
		return zip;
	}

	public Model() {
		super();
	}
}
