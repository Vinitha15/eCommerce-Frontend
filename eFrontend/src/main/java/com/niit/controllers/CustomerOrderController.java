package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String getShippingform(Model model){
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		Customer customer=customerservice.customerbyusername(username);
		Cart cart=customer.getCart();
		model.addAttribute("shippingaddress",customer.getShippingaddress());
		model.addAttribute("Cartid",cart.getId());
		return "shippingaddress";
		
	}
	
	@RequestMapping("/cart/order")
	public String createorder(@ModelAttribute ShippingAddress shippingaddress,Model model){
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		Customer customer=customerservice.customerbyusername(username);
		Cart cart=customer.getCart();
		customer.setShippingaddress(shippingaddress);
		cart.setCustomer(customer);
		CustomerOrder customerorder= customerorderservice.Createorder(cart);
		model.addAttribute("order",customerorder);
		model.addAttribute("Cartid",cart.getId());
		return "orderdetails";
	}
	
	@RequestMapping("/cart/confirm")
	public String confirm(@ModelAttribute CustomerOrder customerorder,Model model){
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		Customer customer=customerservice.customerbyusername(username);
		Cart cart=customer.getCart();
		cartitemservice.aftercheckout(cart.getId());
		return "payment";
	}
	@RequestMapping("/cart/thankyou")
	public String cash(){
		return "thankyou";
	}
	
}
