package com.pro.model;

import java.io.Serializable;

public class BookModel implements Serializable {

	private int id;
	private String title;
	private String description;
	private String imgName;
	private String category;
	private double price;
	
	
	public BookModel(int id, String title, String category, double price) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.price = price;
	}

	public BookModel(int id, String title, String description, String imgName, String category, double price) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.imgName = imgName;
		this.category = category;
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getDescription() {
		return description;
	}
	public String getImgName() {
		return imgName;
	}
	public String getCategory() {
		return category;
	}

	public double getPrice() {
		return price;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}

	public BookModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
