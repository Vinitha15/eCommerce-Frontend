package com.niit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CustomerOrderDao;
import com.niit.model.Cart;
import com.niit.model.CustomerOrder;
import com.niit.model.ShippingAddress;

@Service
@Transactional
public class CustomerOrderServiceImpl implements CustomerOrderService {
	
	@Autowired
	private CustomerOrderDao customerorderdao;

	public CustomerOrder Createorder(Cart cart, ShippingAddress s) {
		return customerorderdao.Createorder(cart,s);
	}

	public List<ShippingAddress> getshippingbyid(int id) {
		
		return customerorderdao.getshippingbyid(id);
	}

	public ShippingAddress getshipping(int id) {
		return customerorderdao.getshipping(id);
	}

	public void saveshipping(ShippingAddress shipping) {
		customerorderdao.saveshipping(shipping);
		
	}

}
