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
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<CartModel> list = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			CartModel cm = new CartModel();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<CartModel> cartList = (ArrayList<CartModel>) session.getAttribute("cartList");
			
			if(cartList == null) {
				list.add(cm);
				session.setAttribute("cartList", list);
				response.sendRedirect("index.jsp");
			}
			else {
				
				list = cartList;
				boolean flag = false;
				
				for (CartModel cartModel : cartList) {
					if(cartModel.getId() == id) {
						flag = true;
						out.print("<h2 style = 'color:red; text-align:center'>Item already exists in cart go back to <a href = 'cart.jsp'>Cart Page</a></h2>");
					}
				}
				if(!flag) {
					list.add(cm);
					response.sendRedirect("index.jsp");
				}
			}
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
