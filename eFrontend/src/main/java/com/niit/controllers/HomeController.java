package com.niit.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Authorities;
import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.service.CartItemService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productservice;
	
	@Autowired
	private CartItemService cartitemservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@RequestMapping("/home")
	public String homePage(HttpSession session,Model model)
	{
		session.setAttribute("categories", productservice.getallcategories());
		List<Product> products=productservice.getallproducts();
		model.addAttribute("product", products);
		/*if( SecurityContextHolder.getContext().getAuthentication().getPrincipal()!=null){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Authorities a=(Authorities) user.getAuthorities();
		System.out.println(a.getRole());
		if(a.getRole().equals("ROLE_USER")){
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		}}
		*/return "slider";
	}
	@RequestMapping("/aboutus")
	public String aboutus(Model model)
	{
		/*User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Authorities a=(Authorities) user.getAuthorities();
		if(a.getRole().equals("ROLE_USER")){
		Customer customer = customerservice.customerbyusername(username);
		Cart cart = customer.getCart();
		model.addAttribute("count", cartitemservice.getcartcount(cart.getId()));
		}*/
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
