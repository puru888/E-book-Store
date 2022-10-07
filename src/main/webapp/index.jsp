<%@page import="com.pro.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pro.model.BookModel"%>
<%@page import="com.pro.daoImpl.DaoImpl"%>
<%@page import="com.pro.dao.Dao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
	List list = (List)session.getAttribute("list");
	List<BookModel> searchList = (List<BookModel>)request.getAttribute("searchList");
if(list != null){
		request.setAttribute("list", list);
	}
	Dao d = new DaoImpl();
	List<BookModel> bmList = d.getAllBooks();
	
	ArrayList<CartModel> cartList = (ArrayList<CartModel>)session.getAttribute("cartList");

	if(cartList != null){
		request.setAttribute("cartList", cartList);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="includes/nav.jsp"></jsp:include>
<%
if(request.getSession().getAttribute("list") != null)
{%>
	<h1>Welcome, <%=list.get(2) %></h1>
<%}
%>
<div class = "container">
<div class = "card-header my-3">All Books</div>
<div class = "row">
<%
if(!bmList.isEmpty() && searchList == null){
	for(BookModel bm : bmList){%>
		<div class = "col-md-3">
		<div class="card" style="width: 18rem;">
		  <img class="card-img-top" src="img/<%=bm.getImgName()%>.jpg" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title"><%=bm.getTitle() %></h5>
		    <h6 class = "price"><%=bm.getPrice() %>$</h6>
		    <h6 class = "category"><%=bm.getCategory() %></h6>
		    <div class = "mt-3 d-flex justify-content-between">
		        <a href="AddToCartServlet?id=<%=bm.getId()%>" class="btn btn-dark">Add to Cart</a>
				<a href="BuyNowServlet?qty=1&id=<%=bm.getId() %>" class="btn btn-primary">Buy Now</a>
		    </div>
		  </div>
		</div>
		</div>
	<%}
}
%>
<%
if(searchList != null){
if(!searchList.isEmpty()){
	for(BookModel bm : searchList){%>
		<div class = "col-md-3">
		<div class="card" style="width: 18rem;">
		  <img class="card-img-top" src="img/<%=bm.getImgName()%>.jpg" alt="Card image cap">
		  <div class="card-body">
		    <h5 class="card-title"><%=bm.getTitle() %></h5>
		    <h6 class = "price"><%=bm.getPrice() %>$</h6>
		    <div class = "mt-3 d-flex justify-content-between">
		        <a href="AddToCartServlet?id=<%=bm.getId()%>" class="btn btn-dark">Add to Cart</a>
				<a href="BuyNowServlet?qty=1&id=<%=bm.getId() %>" class="btn btn-primary">Buy Now</a>
		    </div>
		  </div>
		</div>
		</div>
	<%}
}}
%>
</div>
</div>
</body>
</html>
<jsp:include page="includes/footer.jsp"></jsp:include>