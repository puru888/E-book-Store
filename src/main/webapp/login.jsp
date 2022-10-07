<%@page import="com.pro.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	List list = (List)session.getAttribute("list");
	if(list != null)
	{
		response.sendRedirect("index.jsp");
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
<title>Login</title>
<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<jsp:include page="includes/nav.jsp"></jsp:include>
<div class = "container">
<div class = "card w-50 mx-auto my-5">
<div class = "card-header text-center">User Login</div>
<div class = "card-body">
<form action="LoginServlet" method="post">
<div class = "form-group">
<label>E-mail</label>
<input type = "email" class = "form-control" name = "email" placeholder="Enter your email" required>
</div>
<div class = "form-group">
<label>Password</label>
<input type = "password" class = "form-control" name = "password" required>
</div>
<div class = "text-center mt-3">
<button type="submit" class = "btn btn-primary">Login</button>
</div>
<div class = "form-group">
<a class="link-secondary" href = "register.jsp">Register Here!</a>
</div>
</form>
</div>
</div>
</div>

<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>