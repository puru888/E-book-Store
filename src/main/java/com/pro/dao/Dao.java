package com.pro.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pro.model.BookModel;
import com.pro.model.BuyModel;
import com.pro.model.CartModel;
import com.pro.model.Model;

public interface Dao {

	int insert(Model m) throws ClassNotFoundException, SQLException;
	List validateUser(Model m) throws ClassNotFoundException, SQLException;
	List<BookModel> getAllBooks() throws ClassNotFoundException, SQLException;
	List<BookModel> searchByCategory(String search) throws ClassNotFoundException, SQLException;
	List<CartModel> getCart(List<CartModel> list) throws ClassNotFoundException, SQLException;
	double getTotalPrice(ArrayList<CartModel> cartList) throws ClassNotFoundException, SQLException;
	int insert(BuyModel bm) throws ClassNotFoundException, SQLException;
	List<BuyModel> getUserOrder(int id) throws ClassNotFoundException, SQLException;
	void deleteOrder(int id) throws ClassNotFoundException, SQLException;;
}
