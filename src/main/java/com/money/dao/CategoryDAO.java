package com.money.dao;

import java.util.List;

import com.money.model.Category;

public interface CategoryDAO {
	List<Category> findAll();
	Category findBy(int categoryId);
	Category findBy(String categoryName);
	boolean add(Category category);
	boolean deleteCategory(int categoryId);
	boolean updateCategory(Category category);
	
}
