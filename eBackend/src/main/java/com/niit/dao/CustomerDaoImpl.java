package com.niit.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Authorities;
import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.ShippingAddress;
import com.niit.model.User;
@Repository
public class CustomerDaoImpl implements CustomerDao{
	@Autowired
	private SessionFactory sessionFactory; 
	public void registerCustomer(Customer customer) {
		
		User user= customer.getUser();  
		user.setEnabled(true);
		
		Authorities authorities= new Authorities();
		authorities.setRole("ROLE_USER");
		String username=customer.getUser().getUsername(); 
		authorities.setUsername(username);
		Session session=sessionFactory.getCurrentSession();
		session.save(authorities);
		
		Cart cart=new Cart();
		cart.setCustomer(customer);
		customer.setCart(cart);
		ShippingAddress s= new ShippingAddress();
		s.setDoorno(customer.getBillingaddress().getDoorno());
		s.setStreetname(customer.getBillingaddress().getStreetname());
		s.setCity(customer.getBillingaddress().getCity());
		s.setState(customer.getBillingaddress().getState());
		s.setCountry(customer.getBillingaddress().getCountry());
		s.setZipcode(customer.getBillingaddress().getZipcode());
		s.setCustomer(customer);
		session.save(s);
		session.save(customer);
	}
	public User validateUsername(String username) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User where username=?");
		query.setString(0,username);
		User user=(User)query.uniqueResult();
		return user;
	}
	public Customer validateEmail(String email) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Customer where email=?");
		query.setString(0,email);
		Customer customer=(Customer)query.uniqueResult();
		return customer;
	}
	public Customer customerbyusername(String username) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Customer where user.username=?");
		query.setString(0,username);
		Customer customer=(Customer)query.uniqueResult();
		return customer;
	}

}
