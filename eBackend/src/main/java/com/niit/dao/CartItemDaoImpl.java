package com.niit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Product;
@Repository
public class CartItemDaoImpl implements CartItemDao{
	@Autowired
	private SessionFactory sessionFactory;
	public void addtocart(CartItem cartitem) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(cartitem);		
	}

	public void removecartitem(int cartitemid) {
		Session session=sessionFactory.getCurrentSession();
		CartItem cartitem=(CartItem)session.get(CartItem.class, cartitemid);
		session.delete(cartitem);	
		
	}

	public void removeallcartitem(int cartid) {
		Session session=sessionFactory.getCurrentSession();
		Cart cart=(Cart)session.get(Cart.class, cartid);
		List<CartItem> cartitems= cart.getCartitems();
		for(CartItem cartitem: cartitems)
			session.delete(cartitem);
		
	}

	public Cart getCart(int id) {
		Session session=sessionFactory.getCurrentSession();
		Cart cart=(Cart) session.get(Cart.class, id);
		return cart;
		}

}
