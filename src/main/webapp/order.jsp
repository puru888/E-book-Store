<%@page import="com.pro.model.BuyModel"%>
<%@page import="com.pro.daoImpl.DaoImpl"%>
<%@page import="com.pro.dao.Dao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.pro.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DecimalFormat format = new DecimalFormat("#.##");
request.setAttribute("format", format);
List list = (List)session.getAttribute("list");
List<BuyModel> orderList = null;
if(list != null)
{
	request.setAttribute("list", list);
	Dao d = new DaoImpl();
	orderList = (List<BuyModel>)d.getUserOrder((int)list.get(1));
}else{
	response.sendRedirect("login.jsp");
}
ArrayList<CartModel> cartList = (ArrayList<CartModel>)session.getAttribute("cartList");

if(cartList != null){
	request.setAttribute("cartList", cartList);
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="includes/nav.jsp"></jsp:include>
<div class = "container">
<div class = "card-header my-3">All Orders</div>
<table class = "table table-light">
<thead>
<tr>
<th scope = "col">Date</th>
<th scope = "col">Name</th>
<th scope = "col">Category</th>
<th scope = "col">Quantity</th>
<th scope = "col">Price</th>
<th scope = "col">Cancel</th>
</tr>
</thead>
<tbody>
<%
if(orderList != null){
	for(BuyModel bm : orderList){%>
	<tr>
		<td><%=bm.getDate() %></td>
		<td><%=bm.getTitle() %></td>
		<td><%=bm.getCategory() %></td>
		<td><%=bm.getQty() %></td>
		<td><%=format.format(bm.getPrice()) %></td>
		<td>
		<a class = "btn btn-sm btn-danger" href = "CancelOrderServlet?id=<%=bm.getId()%>">Cancel</a>
		</td>
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