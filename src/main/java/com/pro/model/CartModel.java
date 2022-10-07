package com.pro.model;

public class CartModel extends BookModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int quantity;
	
	public CartModel(int id, String title, String description, String imgName, String category, double price,
			int quantity) {
		super(id, title, description, imgName, category, price);
		this.quantity = quantity;
	}

	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public CartModel() {
		super();
		// TODO Auto-generated constructor stub
	}

}
