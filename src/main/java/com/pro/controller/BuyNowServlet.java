package com.pro.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class BuyNowServlet
 */
@WebServlet("/BuyNowServlet")
public class BuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyNowServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		List list = (List) session.getAttribute("list");
		Dao d = new DaoImpl();

		if (list != null) {
			String bookId = request.getParameter("id");
			int bookQty = Integer.parseInt(request.getParameter("qty"));
			if (bookQty <= 0) {
				bookQty = 1;
			}

			BuyModel model = new BuyModel((int) list.get(1), bookQty, format.format(date));
			model.setId(Integer.parseInt(bookId));
			try {
				int i = d.insert(model);
				if (i > 0) {
					ArrayList<CartModel> cartList = (ArrayList<CartModel>) session.getAttribute("cartList");
					if (cartList != null) {
						for (CartModel cartModel : cartList) {
							if (cartModel.getId() == Integer.parseInt(bookId)) {
								cartList.remove(cartList.indexOf(cartModel));
								break;
							}
						}
						response.sendRedirect("order.jsp");
					} else {
						response.sendRedirect("order.jsp");
					}
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("login.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
