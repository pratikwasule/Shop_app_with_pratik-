<%@page import="java.util.Map"%>
<%@page import="helper.Helper1"%>
<%@page import="org.hibernate.query.criteria.internal.ParameterContainer.Helper"%>
<%@page import="entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entity.User1"%>

<%
  User1 user=(User1)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message", "you are not login ");
	response.sendRedirect("login.jsp");
	return;
}else
	if(user.getUserType().equals("normal"))
	{
		session.setAttribute("message", "you are not admin ");
		response.sendRedirect("login.jsp");
		return;
	}
%>
<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> list = cdao.getcategories();

//getting count products & users
Map <String,Long> m=Helper1.getCounts(FactoryProvider.getFactory());
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
 
<%@ include file="component/common_jsp_css_js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
 <div class="card admin-card">
 
 
  <div class="container-admin">
  <div class="container-fluid mt-3">
  <%@ include file="component/message.jsp" %>
  
  </div>
  <div class="row mt-3">
  <!--    first column-->
  
  <div class="col-md-4">
  <div class="card">
  <div class="card body text-center">
  <div class="container">
  <img style="max-width: 125px" class="img-fluid rounded-circle" alt="user_icon" src="img/profile.png">
  </div>
  <h1><%=m.get("userCount") %></h1>
  <h1 class="text-uppercase text-muted">Users</h1>
  </div>
  </div>
  </div>
<!--    second column-->
   <div class="col-md-4">
  <div class="card">
  <div class="card body text-center">
   <div class="container">
  <img style="max-width: 125px" class="img-fluid rounded-circle" alt="user_icon" src="img/category.png">
  </div>
    <h1><%=list.size() %></h1>
    <h1 class="text-uppercase text-muted">Categories</h1>
  </div>
  </div>
  </div>
  <!--    third column-->
  
   <div class="col-md-4">
  <div class="card">
  <div class="card body text-center">
   <div class="container">
  <img style="max-width: 125px" class="img-fluid rounded-circle" alt="user_icon" src="img/product.png">
  </div>
    <h1><%=m.get("productCount") %></h1>
   <h1 class="text-uppercase text-muted">Products</h1>
  </div>
  </div>
  </div>
 </div> 
<!--  second row --> 
 <div class="row mt-3">
 <!--  second row-first col --> 
 
   <div class="col-md-6">
   <div class="card" data-toggle="modal" data-target="#add-category-modal">
  <div class="card body text-center">
   <div class="container">
  <img style="max-width: 125px" class="img-fluid rounded-circle" alt="user_icon" src="img/box.png">
  </div>
   <p class="mt-2"> Click here to add Category</p>
   <h1 class="text-uppercase text-muted">Add Category</h1>
  </div>
  </div>
  </div>
   <!--  second row-second col --> 
  
   <div class="col-md-6">
   <div class="card" data-toggle="modal" data-target="#add-product-modal">
  <div class="card body text-center">
   <div class="container">
  <img style="max-width: 125px" class="img-fluid rounded-circle" alt="user_icon" src="img/plus.png">
  </div>
  <p class="mt-2"> Click here to add Products</p>
   <h1 class="text-uppercase text-muted">Add Products</h1>
  </div>
  </div>
   
   </div>

 </div> 
  </div>
  
  <!--add Category modal -->
  <!-- Button trigger modal -->
 

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="ProductOperationServlet" method="post">
      <input type="hidden" name="operation" value="addCategory"> 
        <div class="form-group">
        <input type="text" class="form-control" name="categoryTitle" placeholder="Enter Category Title" required="required">
        </div>
         <div class="form-group">
         <textarea style="height: 250px;" class="form-control" name="categoryDescription" placeholder="Enter Category Description..." required="required"></textarea>
         </div>
         <div class="container text-center">
         <button class="btn btn-outline-success">Add Category</button>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
           </div>
         </form>
      </div>
       
    </div>
  </div>
</div>
    <!--end Category modal -->
    
        <!--product modal-->
 
 <!-- Button trigger modal -->
 

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-black">
        <h5 class="modal-title" id="add-product-modal">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
       <input type="hidden" name="operation" value="addproduct"/>
       <div class="form-group">
        <input type="text" class="form-control" name="productTitle" placeholder="Enter Product Title" required="required">
        </div>
         <div class="form-group">
         <textarea style="height: 250px;" class="form-control" name="productDescription" placeholder="Enter Product Description..." required="required"></textarea>
         </div>
         <div class="form-group">
        <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required="required">
        </div>
        <div class="form-group">
        <input type="number" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required="required">
        </div>
       <div class="form-group">
        <input type="number" class="form-control" name="productQuantity" placeholder="Enter Product Quantity" required="required">
        </div>
        <!--product category create dropdown  -->
      <%--  <%
         CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
         List <Category> list=cdao.getcategories();
       
       %> --%>
       <div class="form-group" >
        
        <select name="catId" class="form-control" id="" >
        <%
         for(Category c:list){
        %>
        <option value="<%=c.getCategoryId() %>"> <%=c.getCategoryTitle() %></option>
        <%
        }
        %>
        </select>
         </div>
       
       <!--product file img  -->
       <div class="form-group row mt-3">
       <label for="pPic">Select Product Picture</label>
       <br>
       <input type="file" id="pPic" name="pPic" required="required">
      </div>
      <div class="container text-center">
      <button class="btn btn-outline-success">Add Product</button>
      </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       </div>
    </div>
  </div>
</div>
     </div>
        <!--end product modal-->
    <%@include file="component/common_modals.jsp" %>
    
  
 </body>
</html>