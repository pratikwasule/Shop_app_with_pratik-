package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;
import entity.Category;
import entity.Product;
import helper.FactoryProvider;

 @WebServlet("/ProductOperationServlet")
 @MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		 
		PrintWriter out=response.getWriter();

 		
 		//fetching category data
 		String op=request.getParameter("operation");
	    if(op.trim().equals("addCategory"))
	    {
	    	//add category
	    	String title=request.getParameter("categoryTitle");
	        String description=request.getParameter("categoryDescription");
	        //save data on db
	        Category category=new Category();
	        category.setCategoryTitle(title);
	        category.setCategoryDecription(description);
	        CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
	        int catId=categoryDao.savecategory(category);
	      //  out.println("Category Saved");
	       HttpSession httpSession= request.getSession();
	       httpSession.setAttribute("message","Category added successfully..!"+catId);
	       response.sendRedirect("admin.jsp");
	       return;
	       
	    }else if(op.trim().equals("addproduct"))
	    {
	    	//add products
	    	String productTitle=request.getParameter("productTitle");
	    	String productDescription=request.getParameter("productDescription");
	    	int productPrice=Integer.parseInt(request.getParameter("productPrice"));
	    	int productDiscount=Integer.parseInt(request.getParameter("productDiscount"));
	    	int productQuantity=Integer.parseInt(request.getParameter("productQuantity"));
	    	int catId=Integer.parseInt(request.getParameter("catId"));
	    	Part pPic=request.getPart("pPic");
            
	    	Product p= new Product(catId, productDescription, productDescription, productDescription, catId, catId, catId);
	    	p.setpName(productTitle);
	    	p.setpDesc(productDescription);
	    	p.setpPrice(productPrice);
	    	p.setpDiscount(productDiscount);
	    	p.setpQuantity(productQuantity);
	    	p.setpPhoto(pPic.getSubmittedFileName());
	    	
	    	//by getteing categoryid
	    	CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
	    	Category category=cdao.getCategoryById(catId);
	    	
	    	p.setCategory(category);
	    	//product data save
	    	ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	    	pdao.saveProduct(p);
	    	out.println("Product save successfully...!");
	    	
 			//photo upload
	    	//finding upload path
	    	String path=request.getRealPath("img")+File.separator+"product"+File.separator +pPic.getSubmittedFileName();						;
	    	System.out.println(path);
	    	//uploading data
	    	try {
	    		FileOutputStream fs =new FileOutputStream(path);
	    		InputStream is=pPic.getInputStream();
				//reading data
	    		byte data[]=new byte[is.available()];
	    		is.read(data);
	    		
	    		//writing data 
	    		fs.write(data);
	    		fs.close();	    		
	    		
			} catch (Exception e) {
            e.printStackTrace();
            }
	    	out.println("product save");

	    	//message
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product added successfully..!");
			response.sendRedirect("admin.jsp");
			return;
	    	

	    	
	    }
	}

}
