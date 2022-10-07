package com.pro.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pro.dao.Dao;
import com.pro.model.BookModel;
import com.pro.model.BuyModel;
import com.pro.model.CartModel;
import com.pro.model.Model;
import com.pro.util.Util;
import com.pro.utilimpl.UtilImpl;


public class DaoImpl implements Dao {

	Util u = new UtilImpl();
	Model model = null;
	ResultSet rs = null;
	
	@Override
	public int insert(Model m) throws ClassNotFoundException, SQLException {
		int i = u.getStatement().executeUpdate("insert into register(fname,lname,email,mobile,password,address,city,state,zip)"
				+ "values('"+m.getFname()+"','"+m.getLname()+"','"+m.getEmail()+"','"+m.getMobile()+"','"+m.getPassword()+"',"
						+ "'"+m.getAddress()+"','"+m.getCity()+"','"+m.getState()+"','"+m.getZip()+"')");
		return i;
	}
	
	@Override
	public List validateUser(Model m) throws ClassNotFoundException, SQLException {
		List list = new ArrayList();
		rs = u.getStatement().executeQuery("select id from register where email = '" + m.getEmail() + "'");
		if (rs.next()) {
			rs = u.getStatement().executeQuery("select id from register where email = '" + m.getEmail()
					+ "' and password = '" + m.getPassword() + "'");
			if (rs.next()) {
				rs = u.getStatement().executeQuery("select id,fname from register where email = '" + m.getEmail()
						+ "' and password = '" + m.getPassword() + "' and status = 'Y'");
				if (rs.next()) {
					list.add("ok");
					list.add(rs.getInt("id"));
					list.add(rs.getString("fname"));
				} else {
					list.add("ub");
				}
			} else {
				list.add("wp");
			}
		} else {
			list.add("wu");
		}

		return list;

	}

	@Override
	public List<BookModel> getAllBooks() throws ClassNotFoundException, SQLException {
		List<BookModel> list = new ArrayList<>();
	
		rs = u.getStatement().executeQuery("select * from products");
		while (rs.next()) {
			BookModel bm = new BookModel(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("imgName"), rs.getString("category"),rs.getDouble("price"));
			list.add(bm);
		}
		
		return list;
	}

	@Override
	public List<CartModel> getCart(List<CartModel> list) throws ClassNotFoundException, SQLException {
		List<CartModel> cartlist = new ArrayList<>();
		
		if(!list.isEmpty()) {
			for (CartModel cartModel : list) {
				rs = u.getStatement().executeQuery("select * from products where id = '"+cartModel.getId()+"'");
				while(rs.next()) {
					CartModel model = new CartModel(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("imgName"), rs.getString("category"), rs.getDouble("price")*cartModel.getQuantity(),cartModel.getQuantity());
					cartlist.add(model);
				}
			}
		}
		
		return cartlist;
	}

	@Override
	public double getTotalPrice(ArrayList<CartModel> cartList) throws ClassNotFoundException, SQLException {
		double sum = 0;
		if(cartList.size() > 0) {
			for (CartModel cartModel : cartList) {
				rs = u.getStatement().executeQuery("select price from products where id = '"+cartModel.getId()+"'");
				while (rs.next()) {
					sum += rs.getDouble("price")*cartModel.getQuantity();
				}
			}
		}
		
		return sum;
	}

	@Override
	public int insert(BuyModel bm) throws ClassNotFoundException, SQLException {
		
		int i = u.getStatement().executeUpdate("insert into orders(book_id,user_id,qty,date) values('"+bm.getId()+"','"+bm.getUid()+"','"+bm.getQty()+"','"+bm.getDate()+"')");
		
		return i;
	}

	@Override
	public List<BuyModel> getUserOrder(int id) throws ClassNotFoundException, SQLException {

		List<BuyModel> list = new ArrayList<>();
		rs = u.getStatement().executeQuery("SELECT * FROM orders INNER JOIN products on book_id = id where user_id = '"+id+"'");
		while (rs.next()) {
		BuyModel bm = new BuyModel(rs.getInt("id"), rs.getString("title"), rs.getString("category"),rs.getDouble("price")*rs.getInt("qty"),rs.getInt("order_id"),rs.getInt("qty"),rs.getString("date"));
		list.add(bm);
		}
		return list;
	}

	@Override
	public void deleteOrder(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		u.getStatement().execute("delete from orders where book_id = '"+id+"'");
	}

	@Override
	public List<BookModel> searchByCategory(String search) throws ClassNotFoundException, SQLException {
		List<BookModel> list = new ArrayList<>();
		
		rs = u.getStatement().executeQuery("select * from products where category like '"+search+"%'");
		while (rs.next()) {
			BookModel bm = new BookModel(rs.getInt("id"), rs.getString("title"), rs.getString("description"), rs.getString("imgName"), rs.getString("category"),rs.getDouble("price"));
			list.add(bm);
		}
		
		return list;
	}


}
