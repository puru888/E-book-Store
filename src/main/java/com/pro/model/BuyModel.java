package com.pro.model;

public class BuyModel extends BookModel {

	private int orderId;
	private int uid;
	private int qty;
	private String date;
	
	public BuyModel(int id, String title, String category, double price, int orderId, int qty, String date) {
		super(id, title, category, price);
		this.orderId = orderId;
		this.qty = qty;
		this.date = date;
	}

	public BuyModel(int orderId, int uid, int qty, String date) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.qty = qty;
		this.date = date;
	}
	
	public BuyModel(int uid, int qty, String date) {
		super();
		this.uid = uid;
		this.qty = qty;
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}

	public int getUid() {
		return uid;
	}

	public int getQty() {
		return qty;
	}

	public String getDate() {
		return date;
	}



	public BuyModel() {}

	public BuyModel(int bid, String title, String category, double price) {
		super(bid, title, category, price);
	}
}
