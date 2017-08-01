package com.niit.service;
import java.util.List;

import com.niit.model.Category;
import com.niit.model.Product;

public interface ProductService {

	void  saveproduct(Product product);
	List<Product> getallproducts();
	Product getproductbyid(int id);
	void deleteproduct(int id);
	List<Category> getallcategories();
	void  savecategory(Category category);
	
}