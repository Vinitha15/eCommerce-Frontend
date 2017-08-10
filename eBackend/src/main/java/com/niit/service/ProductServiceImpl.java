package com.niit.service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
    @Autowired
    private ProductDao productdao;
    
	public void saveproduct(Product product) {
		productdao.saveproduct(product);
	}
	public List<Product> getallproducts() {
		return productdao.getallproducts();
	}
	public Product getproductbyid(int id) {
		return productdao.getproductbyid(id);
		 
	}
	public void deleteproduct(int id) {
		Product product= getproductbyid(id);
		productdao.deleteproduct(product);
	}
	public List<Category> getallcategories() {
		return productdao.getallcategories();
	}
	public void savecategory(Category category) {
		productdao.savecategory(category);
	}

	

	
}