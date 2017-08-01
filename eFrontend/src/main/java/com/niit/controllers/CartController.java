package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;

import com.niit.service.CartItemService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class CartController {
	
	@Autowired
	private CustomerService customerservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private CartItemService cartitemservice;
	
	@RequestMapping("/cart/addtocart/{id}")
	public String addtocart(@PathVariable int id,@RequestParam int units,Model model ){
		Product product=productservice.getproductbyid(id);
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		Customer customer=customerservice.customerbyusername(username);
		Cart cart=customer.getCart();
		List<CartItem> cartitems=cart.getCartitems();
		System.out.println(cart.getCartitems().size());
		for(CartItem cartitem:cartitems){
			if(cartitem.getProducts().getId()==id){
				cartitem.setQuantity(units);
				cartitem.setTotalprice(product.getPrice() * units);
				product.setQuantity(product.getQuantity() - units);
				productservice.saveproduct(product);
				cartitemservice.addtocart(cartitem);
				return "redirect:/cart/getcart";
			}
		}
		CartItem cartitem=new CartItem();
		cartitem.setQuantity(units);
		cartitem.setProducts(product);
		cartitem.setCart(cart);
		cartitem.setTotalprice(product.getPrice() * units);
		product.setQuantity(product.getQuantity() - units);
		productservice.saveproduct(product);
		cartitemservice.addtocart(cartitem);
		return "redirect:/cart/getcart";
	}
	
	@RequestMapping("/cart/getcart")
	public String getcart(Model model){
		User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username=user.getUsername();
		System.out.println(username);
		Customer customer=customerservice.customerbyusername(username);
		Cart cart=customer.getCart();
		int i=cart.getId();
		System.out.println(cart.getCartitems().size());
		System.out.println(i);
		/*List<CartItem> cartitems=cart.getCartitems();
		System.out.println(cartitems);*/
		/*model.addAttribute("cartitems",cartitems);*/
		model.addAttribute("i", cart);
		return "cart";
	}
	
	@RequestMapping("/cart/removecartitem/{cartitemid}")
	public String removecartitem(@PathVariable int cartitemid){
		
		cartitemservice.removecartitem(cartitemid);
		return "redirect:/cart/getcart";
	}
	
	@RequestMapping("/cart/removecart/{cartid}")
	public String removecart(@PathVariable("cartid") int cartid){
		
		cartitemservice.removeallcartitem(cartid);
		return "redirect:/cart/getcart";
	}
	
}
