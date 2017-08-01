package com.niit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CartItemDao;
import com.niit.model.Cart;
import com.niit.model.CartItem;
@Service
@Transactional
public class CartItemServiceImpl implements CartItemService {
	@Autowired
	private CartItemDao cartitemdao;
	public void addtocart(CartItem cartitem) {
		
		cartitemdao.addtocart(cartitem);
	}

	public void removecartitem(int cartitemid) {
		cartitemdao.removecartitem(cartitemid);
		
	}

	public void removeallcartitem(int cartid) {
		cartitemdao.removeallcartitem(cartid);
		
	}

	public Cart getCart(int id) {
		return cartitemdao.getCart(id);
	}

}
