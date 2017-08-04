package com.niit.dao;

import com.niit.model.Cart;
import com.niit.model.CartItem;

public interface CartItemDao {

	void addtocart(CartItem cartitem);
	void removecartitem(int cartitemid);
	void removeallcartitem(int cartid);
	void aftercheckout(int cartid);
	Cart getCart(int id);
	int getcartcount(int id);
}
