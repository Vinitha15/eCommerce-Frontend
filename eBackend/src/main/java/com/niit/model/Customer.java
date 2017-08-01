package com.niit.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotEmpty
	private String fname;
	@NotEmpty
	private String lname;
	@Column(unique = true, nullable = false)
	@Email
	private String email;
	@NotEmpty
	@Size(min = 10, max = 10)
	private String phone;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	@Valid
	private User user;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "billingaddress_id")
	@Valid
	private BillingAddress billingaddress;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shippingaddress_id")
	@Valid
	private ShippingAddress shippingaddress;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "cart_id")
	@Valid
	private Cart cart;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BillingAddress getBillingaddress() {
		return billingaddress;
	}

	public void setBillingaddress(BillingAddress billingaddress) {
		this.billingaddress = billingaddress;
	}

	public ShippingAddress getShippingaddress() {
		return shippingaddress;
	}

	public void setShippingaddress(ShippingAddress shippingaddress) {
		this.shippingaddress = shippingaddress;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}
