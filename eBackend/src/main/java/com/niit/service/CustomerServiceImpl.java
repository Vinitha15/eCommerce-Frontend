package com.niit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CustomerDao;
import com.niit.model.Customer;
import com.niit.model.User;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao customerdao;
	public void registerCustomer(Customer customer) {
		customerdao.registerCustomer(customer);
	
	}
	public User validateUsername(String username) {
		return customerdao.validateUsername(username);
	}
	public Customer validateEmail(String email) {
		return customerdao.validateEmail(email);
	}
	public Customer customerbyusername(String username) {
		return customerdao.customerbyusername(username);
	}

}
