<%@page import="entity.User1"%>
<%
  User1 user=(User1)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message", "you are not login ");
	response.sendRedirect("login.jsp");
	return;
}else
	if(user.getUserType().equals("admin"))
	{
		session.setAttribute("message", "you are not normal User ");
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
<title>Insert title here</title>
</head>
<body>
<marquee>
<h1>This is An Normal Panel...!!!</h1>
</marquee>
</body>
</html>