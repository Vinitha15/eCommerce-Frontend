package com.niit.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.model.ShippingAddress;
@Repository
public class CustomerOrderDaoImpl implements CustomerOrderDao{

	@Autowired
	private SessionFactory sessionFactory;
	public CustomerOrder Createorder(Cart cart,ShippingAddress s) {
		Session session=sessionFactory.getCurrentSession();
		List<CartItem> cartitems=cart.getCartitems();
		double grandtotal=0;
		for(CartItem cartitem: cartitems)
			grandtotal=cartitem.getTotalprice()+grandtotal;
		cart.setGrandtotal(grandtotal);
		Customer customer= cart.getCustomer();
		CustomerOrder customerorder= new CustomerOrder();
		customerorder.setDate(new Date());
		customerorder.setCart(cart);
		customerorder.setCustomer(customer);
		customerorder.setBillingaddress(customer.getBillingaddress());
		customerorder.setShippingaddress(s);
		session.save(customerorder);
		return customerorder;
	}
	public List<ShippingAddress> getshippingbyid(int id) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from ShippingAddress where customer.id=?");
		query.setInteger(0, id);
		List<ShippingAddress> shipping= query.list();
		return shipping;
		
	}
	public ShippingAddress getshipping(int id) {
		Session session=sessionFactory.getCurrentSession();
		ShippingAddress shipping=(ShippingAddress) session.get(ShippingAddress.class, id);
		return shipping;
	}
	public void saveshipping(ShippingAddress shipping) {
		Session session=sessionFactory.getCurrentSession();
		session.save(shipping);
		
	}
	

}
