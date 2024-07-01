package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import entity.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) 
	{
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
            f=true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;

	}
	//get all products
	
	public List<Product> getAllproducts()
	{
		Session session= this.factory.openSession();
 		 Query query=session.createQuery("from Product");
		List<Product> list =query.list();
		return list;
	}
	
	//get all products of given category
	public List<Product> getAllProductById(int cid)

	{
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId=:id");
		query.setParameter("id", cid);

		List<Product> list = query.list();
		return list;

	}
}
