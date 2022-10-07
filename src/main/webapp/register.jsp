<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
<jsp:include page="includes/header.jsp"></jsp:include>
</head>
<body>
<h1 class = "text-center">Register Form</h1>
<div class = "container my-4">
<form class="row g-3" method="post" action = "RegisterServlet">
  <div class="col-md-6">
    <label for="inputfname" class="form-label">First Name</label>
    <input type="text" class="form-control" id="inputfname" name = "fname">
  </div>
  <div class="col-md-6">
    <label for="inputlname" class="form-label">Last Name</label>
    <input type="text" class="form-control" id="inputlname" name = "lname">
  </div>
    <div class="col-md-4">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" class="form-control" id="inputEmail4" name = "email">
  </div>
    <div class="col-md-4">
    <label for="inputMobile" class="form-label">Mobile</label>
    <input type="text" class="form-control" id="inputMobile" name = "mobile">
  </div>
  <div class="col-md-4">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control" id="inputPassword4" name = "password">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">Address</label>
    <input type="text" class="form-control" id="inputAddress" name = "address" placeholder="1234 Main St">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity" name = "city">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <input type="text" class="form-control" id="inputState" name = "state">
  </div>
  <div class="col-md-2">
    <label for="inputZip" class="form-label">Zip</label>
    <input type="text" class="form-control" id="inputZip" name = "zip">
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Sign up</button>
  </div>
</form>
</div>
</body>
</html>
<jsp:include page="includes/footer.jsp"></jsp:include>