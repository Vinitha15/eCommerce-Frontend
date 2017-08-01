package com.niit.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
@Repository
public class CustomerOrderDaoImpl implements CustomerOrderDao{

	@Autowired
	private SessionFactory sessionFactory;
	public CustomerOrder Createorder(Cart cart) {
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
		customerorder.setShippingaddress(customer.getShippingaddress());
		session.save(customerorder);
		return customerorder;
	}

}
