package com.niit.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Category;
import com.niit.model.Product;
@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	public void saveproduct(Product product) {
		
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);
	}
	public List<Product> getallproducts() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product");
		List<Product> products=query.list();
		return products;
	}
	public Product getproductbyid(int id) {
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product) session.get(Product.class, id);
		return product;
	}
	public void deleteproduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(product);
		
	}
	public List<Category> getallcategories() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		List<Category> categories=query.list();
		return categories;
	}
	public void savecategory(Category category) {
		Session session=sessionFactory.getCurrentSession();
		session.save(category);
		
	}
}
