package com.gray.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.gray.javaproject.models.Category;
import com.gray.javaproject.models.Product;
import com.gray.javaproject.repositories.CategoryRepository;
import com.gray.javaproject.repositories.ProductRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Autowired
	private ProductRepository productRepo;

	
//	get all 
	public List<Category> findAllCategories() {
		return (List<Category>) this.categoryRepo.findAll();
	}
	
//	add new
	public Category addNewCategory(Category category, BindingResult result) {

		Optional<Category> newCategory = categoryRepo.findByCategoryName(category.getCategoryName());

		if (newCategory.isPresent()) {
			result.rejectValue("categoryName", "Present", "Folder name is already taken, choose again");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return categoryRepo.save(category);
		}
	}
	
//	is duplicate?
	public Category categoryNameIsPresent(Category category, BindingResult result) {

		Optional<Category> newCategory = categoryRepo.findByCategoryName(category.getCategoryName());

		if (newCategory.isPresent()) {
			result.rejectValue("categoryName", "Present", "Folder name is already taken, choose again");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return null;
		}
	}

//	update
	public Category updateCategory(Category c) {
		return this.categoryRepo.save(c);
	}

//	find one by id
	public Category viewOne(Long id) {
		return this.categoryRepo.findById(id).orElse(null);
	}

//	delete by id
	public void deleteOne(Long id) {
		this.categoryRepo.deleteById(id);
	}
	
}
