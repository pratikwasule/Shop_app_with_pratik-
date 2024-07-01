<%
  User1 user=(User1)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message", "you are not login so you can't access checkout page ");
	response.sendRedirect("login.jsp");
	return;
}


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
<%@ include file="component/common_jsp_css_js.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-3">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-3">Your Order Details</h3>
						<form action="#!">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=user.getUserEmail()%>" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input
									value="<%=user.getUserName()%>" type="text"
									class="form-control" id="name" placeholder="Enter Your Name">
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input
									value="<%=user.getUserPhone()%>" type="number"
									class="form-control" id="phone"
									placeholder="Enter Your Contact">
							</div>
							<div class="form-group">
								<label for="name">Your Shipping Address</label>
								<input value="<%=user.getUserAddress()%>"
									class="form-control" id="address" placeholder="Enter Your Address" >
 							</div>
							<div class="container text-center">
<button class="btn btn-outline-success">Order Now</button>
<button class="btn btn-outline-primary">Continue Shopping</button>

</div>
						</form>
 					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<%@ include file="/component/common_modals.jsp" %>

</html>