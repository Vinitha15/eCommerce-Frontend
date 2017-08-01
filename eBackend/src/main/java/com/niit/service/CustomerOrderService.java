package com.niit.service;

import com.niit.model.Cart;
import com.niit.model.CustomerOrder;

public interface CustomerOrderService {
	
	 CustomerOrder Createorder(Cart cart);

}
