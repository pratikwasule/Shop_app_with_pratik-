package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.User1;
import helper.FactoryProvider;
 
@WebServlet("/RegisterServlet")
 
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;	 
	 
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out=response.getWriter();
			try {
				String userName=request.getParameter("user_name");
				String userEmail=request.getParameter("user_email");
				String userPassword=request.getParameter("user_password");
				String userPhone=request.getParameter("user_phone");
				String userAddress=request.getParameter("user_address");
				String userType=request.getParameter("user_type");
				//validations
				if(userName.isEmpty())
				{
					out.println("Name is Blank");
					return;
				}
				//creating user data store on db
				User1 user1=new User1(userName,userEmail,userPassword,userPhone,"Default.jpg",userAddress,"normal");
				Session  hibernaateSession=FactoryProvider.getFactory().openSession();
				Transaction tx=hibernaateSession.beginTransaction();
				int userID=(int) hibernaateSession.save(user1);
				tx.commit();
				hibernaateSession.close();
				 
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message","Registration Successful...!!" +userID );
				response.sendRedirect("register.jsp");
				return;
				
				
			} catch (Exception e) {
			 e.printStackTrace();	
			 }
			}
}