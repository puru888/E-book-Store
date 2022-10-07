	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">E-BookStore</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge rounded-pill bg-danger mx-1">${cartList.size()}</span></a></li>
					<%if(request.getAttribute("list") != null)
					{%>
						<li class="nav-item"><a class="nav-link" href="order.jsp">Order</a></li>
						<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>

					<%} 
					else{ %>
						<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<%}
					%>
						
				</ul>
		<form class="d-flex" action = "CategoryByServlet" method = "post">
        <input class="form-control me-2" type="search" name = "search" placeholder="Search By Category" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
			</div>
		</div>
	</nav>