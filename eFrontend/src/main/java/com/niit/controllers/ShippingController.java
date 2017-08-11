package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Customer;
import com.niit.model.ShippingAddress;
import com.niit.service.CustomerOrderService;
import com.niit.service.CustomerService;

@Controller
public class ShippingController {
	
	@Autowired
	private CustomerOrderService customerorderservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("/cart/add/shipping")
	public String addShipping(@ModelAttribute (name="shippingaddress") ShippingAddress shipping){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerservice.customerbyusername(username);
		shipping.setCustomer(customer);
		customerorderservice.saveshipping(shipping);
		return "redirect:/cart/shippingaddressform";
	}

}
