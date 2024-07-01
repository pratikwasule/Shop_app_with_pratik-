package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User1;
import helper.FactoryProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{			
		PrintWriter out=response.getWriter();

	//Data fetch Code Here
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//validations
		
		//authentication
		UserDao userDao=new UserDao(FactoryProvider.getFactory());
		User1 user= userDao.getUseByEmailAndPassword(email, password);
		System.out.println(user);
		HttpSession httpsession=request.getSession();
		
		if(user==null)
		{
			 //out.println("<h1>Invalid User..!!!</h1>");
			  httpsession.setAttribute("message",  "Invalid User..! Try with another");
			  response.sendRedirect("login.jsp");
			  return;
		}else
		{
			 out.println("<h1> Welcome :-" +user.getUserName()+"</h1>");
		}
		httpsession.setAttribute("current-user", user);
		//admin & normal	
		if(user.getUserType().equals("admin"))		
		{
			response.sendRedirect("admin.jsp");
		}else if(user.getUserType().equals("normal"))
		{
			response.sendRedirect("normal.jsp");
		}else
		{
			out.println("We have not Identify Thank You..!!!!");
		}
	
	} 
	
	 

}
