package com.pro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.model.CartModel;

/**
 * Servlet implementation class IncreDecreServlet
 */
@WebServlet("/IncreDecreServlet")
public class IncreDecreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncreDecreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			String param = request.getParameter("param");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<CartModel> list = (ArrayList<CartModel>)request.getSession().getAttribute("cartList");
			
			if(param != null && id >= 1) {
				if(param.equals("inc")) {
					for (CartModel cartModel : list) {
						if(cartModel.getId() == id) {
							int qty = cartModel.getQuantity();
							qty++;
							cartModel.setQuantity(qty);
							request.setAttribute("qty", qty);
							response.sendRedirect("cart.jsp");
						}
					}
				}
				if(param.equals("dec")) {
					for (CartModel cartModel : list) {
						if(cartModel.getId() == id && cartModel.getQuantity() > 1) {
							int qty = cartModel.getQuantity();
							qty--;
							cartModel.setQuantity(qty);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			}
			else
				response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
