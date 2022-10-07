package com.pro.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dao.Dao;
import com.pro.daoImpl.DaoImpl;
import com.pro.model.BuyModel;
import com.pro.model.CartModel;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Dao d = new DaoImpl();
		List list = (List) session.getAttribute("list");
		ArrayList<CartModel> cartList = (ArrayList<CartModel>) session.getAttribute("cartList");

		if(cartList != null && list != null) {
			for (CartModel cartModel : cartList) {
				BuyModel model = new BuyModel((int) list.get(1), cartModel.getQuantity(), format.format(date));	
				model.setId(cartModel.getId());
				try {
					int i = d.insert(model);
					if(i==0) break;
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
			cartList.clear();
			response.sendRedirect("order.jsp");
		}else {
			if(list == null)
				response.sendRedirect("login.jsp");
			if(cartList == null)
				response.sendRedirect("cart.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
