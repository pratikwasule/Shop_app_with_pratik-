<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<%@ include file="component/common_jsp_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-4 offset-md-4">
<div class="card">
<%@ include file="component/message.jsp" %>
<div class="card-body px-5">
<div class="container text-center">
<img src="img/signup.png" style="max-width:100px;" class="img-fluid" align="top">
</div>
 <h3 class="text-center my-3">Sign Up Here..!!</h3>
<form action="RegisterServlet" method="get" >
<div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="name"   placeholder="Enter here name">
   </div>
   <div class="form-group">
    <label for="name">User Email</label>
    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here email">
   </div>
   <div class="form-group">
    <label for="name">User Password</label>
    <input name="user_password" type="password" class="form-control" id="password"   placeholder="Enter here password">
   </div>
   <div class="form-group">
    <label for="name">User phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone"   placeholder="Enter here phone">
   </div>
   <div class="form-group">
    <label for="name">User Address</label>
    <textarea name="user_address" height="200px;" class="form-control" id="address" placeholder="Enter here address"></textarea>
   </div>
    
    <div class="container text-center">
    <button class="btn btn-outline-success">Register</button>
    <button class="btn btn-outline-warning">Reset</button></div>   
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>