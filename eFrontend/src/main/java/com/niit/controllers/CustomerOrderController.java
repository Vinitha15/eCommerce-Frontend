package com.niit.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.model.ShippingAddress;
import com.niit.service.CartItemService;
import com.niit.service.CustomerOrderService;
import com.niit.service.CustomerService;

@Controller
public class CustomerOrderController {

	@Autowired
	private CartItemService cartitemservice;

	@Autowired
	private CustomerService customerservice;

	@Autowired
	private CustomerOrderService customerorderservice;

	@RequestMapping("/cart/shippingaddressform")
	public String getShippingform(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		model.addAttribute("shippingaddress", customer.getShippingaddress());
		model.addAttribute("Cartid", cart.getId());
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		
		return "shippingaddress";

	}

	@RequestMapping("/cart/order")
	public String createorder(@ModelAttribute ShippingAddress shippingaddress,HttpSession session, Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		customer.setShippingaddress(shippingaddress);
		cart.setCustomer(customer);
		CustomerOrder customerorder = customerorderservice.Createorder(cart);
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = customerorder.getDate();
		Random rand = new Random();
		int i = 2 + rand.nextInt(3);
		System.out.println(i);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, i);
		String d = sdf.format(c.getTime());
		System.out.println(d);
		int dd = c.get(Calendar.DATE);
		long yy = c.get(Calendar.YEAR);
		String mm = new SimpleDateFormat("MMM").format(c.getTime());
		String day = new SimpleDateFormat("EE").format(c.getTime());
		String delivery=day + ", " + mm + " " + dd + " " + yy;
		session.setAttribute("delivery",delivery);
		session.setAttribute("username",username);
		model.addAttribute("order", customerorder);
		model.addAttribute("Cartid", cart.getId());
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		return "orderdetails";
	}

	@RequestMapping("/cart/confirm")
	public String confirm(@ModelAttribute CustomerOrder customerorder, Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		return "payment";
	}

	@RequestMapping("/cart/thankyou")
	public String cash(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		cartitemservice.aftercheckout(cart.getId());
		return "thankyou";
	}

}
