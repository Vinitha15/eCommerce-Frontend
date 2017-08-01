package com.niit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CartItem {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@ManyToOne
	@JoinColumn(name="pid")
	private Product products;
	private int quantity;
	private double totalprice;
	@ManyToOne
	@JoinColumn(name="cartid")
	private Cart cart;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public Product getProducts() {
		return products;
	}
	public void setProducts(Product products) {
		this.products = products;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	

}
