package com.pro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.model.CartModel;

/**
 * Servlet implementation class RemoveItemServlet
 */
@WebServlet("/RemoveItemServlet")
public class RemoveItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveItemServlet() {
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
		String id = request.getParameter("id");
		HttpSession session = request.getSession();

		if (id != null) {
			ArrayList<CartModel> cartList = (ArrayList<CartModel>) session.getAttribute("cartList");
			if (cartList != null) {
				for (CartModel cartModel : cartList) {
					if (cartModel.getId() == Integer.parseInt(id)) {
						cartList.remove(cartList.indexOf(cartModel));
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			} else {
				response.sendRedirect("cart.jsp");
			}

		}
	}
}
