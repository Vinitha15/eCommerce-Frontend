package com.niit.controllers;



import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Customer;
import com.niit.model.User;
import com.niit.service.CustomerService;

@Controller

public class CustomerController {
	
	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("/all/RegistrationForm")
	public String getRegistrationForm(Model model){
		model.addAttribute("customer",new Customer());
		return "register";
	}

	@RequestMapping("/all/saveCustomer")
	public String saveCustomer(@Valid @ModelAttribute Customer customer,BindingResult result, Model model){
		if(result.hasErrors())
			return "register";
		User user=customerservice.validateUsername(customer.getUser().getUsername());
		if(user!=null)
		{
			model.addAttribute("duplicateuser","Username Already Exist");
			return "register";
		}
		Customer duplicatecustomer=customerservice.validateEmail(customer.getEmail());
		if(duplicatecustomer!=null)
		{ 
			model.addAttribute("duplicateEmail","Email Already Exist");
			return "register";
		}
		customerservice.registerCustomer(customer);
		return "redirect:/all/products/getallproducts";
	}
}
