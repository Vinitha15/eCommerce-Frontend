package com.niit.dao;

import java.util.List;

import com.niit.model.Category;
import com.niit.model.Product;
public interface ProductDao {
	void saveproduct(Product product);
	List<Product> getallproducts();
	Product getproductbyid(int id);
	void deleteproduct(Product product);
	List<Category> getallcategories();
	void savecategory(Category category);
	

}
