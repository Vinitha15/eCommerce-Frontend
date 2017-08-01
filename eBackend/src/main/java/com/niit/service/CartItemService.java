package com.niit.service;

import com.niit.model.Cart;
import com.niit.model.CartItem;

public interface CartItemService {
	
	void addtocart(CartItem cartitem);
	void removecartitem(int cartitemid);
	void removeallcartitem(int cartid);
	Cart getCart(int id);

}
