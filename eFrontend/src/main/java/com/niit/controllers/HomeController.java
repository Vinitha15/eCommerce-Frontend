package com.niit.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Product;
import com.niit.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productservice;
	
	@RequestMapping("/home")
	public String homePage(HttpSession session,Model model)
	{
		session.setAttribute("categories", productservice.getallcategories());
		List<Product> products=productservice.getallproducts();
		model.addAttribute("product", products);
		return "slider";
	}
	@RequestMapping("/aboutus")
	public String aboutus()
	{
		
		return "aboutus";
	}
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, Model model)
	{
		if(error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
			}
		
		if(logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
			}
		return "login";
	}

}
