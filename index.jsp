<%@page import="helper.Helper1"%>
<%@page import="entity.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart3</title>
<%@include file="component/common_jsp_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<div class="container-fluid">
 <div class="row mt-3 mx-2">
 <%
 String cat = request.getParameter("category");
 //out.println(cat);

 ProductDao dao = new ProductDao(FactoryProvider.getFactory());
  List<Product> list = null;
 
 if (cat==null || cat.trim().equals("all"))
 {
 	list = dao.getAllproducts();
 } else {
 	int cid = Integer.parseInt(cat.trim());
 	list = dao.getAllProductById(cid);
 }
  
 CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
 List<Category> clist = cdao.getcategories();
 %>
<!--  show categories--> 
<div class="col-md-2">
<div class="list-group mt-4">
<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
All Products
</a>

 
   <%
  for(Category c:clist){
	  
	  
  %>
  
  
<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action active"><%=c.getCategoryTitle() %></a>
  
  <%
  }
   if(list.size()==0)
   {
	   out.println("<marque> <h1>no item in this category<h1><marque>");
   }
  %>
  
  
 </div> 
 </div>
 
 
 <!-- show products-->
 <div class="col-md-10">
<!--  row -->
<div class="row mt-4">
<!-- col:12 grid -->
<div class="col-md-12">
<div class=" card-columns">
<!-- traversing products using for loop -->
<%
  for(Product p:list){
	 %>
<!-- 	 show product --> 
 <div class="card product-card">
 <div class="container text-center">
 <img alt="" src="img/product/<%=p.getpPhoto()%>" style="max-height=200px;max-width:100%; width: auto; " class="img-card-top m-2">
 </div>
 <div class="card-body">
 <h5 class="card-title">
 <%= p.getpName()%></h5>
 <p class="card-text">
 <%=Helper1.get10words(p.getpDesc()) %></p>
 </div>
 <div class="card-footer text-center">
 <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpriceafterApplyingDiscount()%>)"> Add to Cart</button>
 <button class="btn btn-outline-success"> &#8377; <%=p.getpriceafterApplyingDiscount()%>/- &#8377;<%=p.getpPrice()%><span class="text-secondary discount-label"> <%=p.getpDiscount()%>%off</span></button>
 
 </div>
 </div>	  
	
<%
	 
  }
%>
</div>
</div>
</div> 
</div>
</div>
</div>
<%@ include file="/component/common_modals.jsp" %>
</body>
</html>