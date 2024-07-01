package dao;

 
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import entity.User1;

public class UserDao {
	private SessionFactory factory;
	
	public UserDao(SessionFactory factory)
	{
		this.factory=factory;
		
	}
//get user by email & password
	public User1 getUseByEmailAndPassword(String email,String password)
	{
	User1 user=null;
	try {
		String query="from User1 where userEmail=:e and userPassword=:p";
		Session session=this.factory.openSession();
		Query q=session.createQuery(query);
		q.setParameter("e", email);
		q.setParameter("p", password);
		user=(User1)q.uniqueResult();
		session.close();
		} catch (Exception e) {
      e.printStackTrace();
}
	return user;
	}
}
