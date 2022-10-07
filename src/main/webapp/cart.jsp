<%@page import="java.text.DecimalFormat"%>
<%@page import="com.pro.dao.Dao"%>
<%@page import="com.pro.daoImpl.DaoImpl"%>
<%@page import="com.pro.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DecimalFormat format = new DecimalFormat("#.##");
request.setAttribute("format", format);
List list = (List)session.getAttribute("list");
if(list != null)
{
	request.setAttribute("list", list);
}

ArrayList<CartModel> cartList = (ArrayList<CartModel>)session.getAttribute("cartList");
List<CartModel> cart = null;
if(cartList != null){
	Dao d = new DaoImpl();
	cart = d.getCart(cartList);
	request.setAttribute("cartList", cartList);
	double total = d.getTotalPrice(cartList);
	request.setAttribute("total", total);
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="includes/nav.jsp"></jsp:include>
<div class = "container">
<div class = "d-flex py-3">
<h3>Total Price: ${(total>0)?format.format(total):0}$</h3>
<a class = "mx-3 btn btn-primary" href="CheckOutServlet">Check Out</a>
</div>
<table class = "table table-light">
<thead>
<tr>
<th scope="col">Name</th>
<th scope="col">Category</th>
<th scope="col">Price</th>
<th scope="col">Buy Now</th>
<th scope="col">Cancel</th>
</tr>
</thead>
<tbody>
<%  
if(cartList != null){
	for(CartModel cm : cart){%>
		<tr>
		<td><%=cm.getTitle() %></td>
		<td><%=cm.getCategory() %></td>
		<td><%=format.format(cm.getPrice()) %></td>
		<td>
		<form action="BuyNowServlet" method="post" class = "form-inline">
		<input type = "hidden" name = "id" value = "<%=cm.getId() %>" class = "form-input">
		<div class = "form-group d-flex w-50">
		<a class = "btn btn-sm btn-incre" href="IncreDecreServlet?param=inc&id=<%=cm.getId()%>"><i class = "fas fa-plus-square"></i></a>
		<input type = "text" name = "qty" class = "from-control w-50" value = "<%=cm.getQuantity() %>" readonly>
		<a class = "btn btn-sm btn-decre" href="IncreDecreServlet?param=dec&id=<%=cm.getId()%>"><i class = "fas fa-minus-square"></i></a>
		<button class = "btn btn-primary btn-sm">Buy</button>
		</div>
		</form>
		</td>
		<td><a href = "RemoveItemServlet?id=<%=cm.getId()%>" class = "btn btn-sm btn-danger">Remove</a></td>
		</tr>
	<%}
}
%>
</tbody>
</table>
</div>

<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>