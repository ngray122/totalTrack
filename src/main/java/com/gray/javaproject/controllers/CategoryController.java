package com.gray.javaproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gray.javaproject.models.Category;
import com.gray.javaproject.models.Product;
import com.gray.javaproject.services.CategoryService;
import com.gray.javaproject.services.ProductService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
//	----> Post Create Form <----
	@PostMapping("/category/create")
	public String addNewProduct(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
		this.categoryService.categoryNameIsPresent(category, result);
		
		if (result.hasErrors()) {
			model.addAttribute("category", category);
			System.out.println("Err for create new category => " + result);
			return "addNewProduct.jsp";
		} else {
			this.categoryService.addNewCategory(category, result);
			return "redirect:/dashboard";
		}
	}
	
//	----> View One <----
	@GetMapping("/category/detail/{id}")
	public String viewOne(@PathVariable("id") Long id, Model model,  HttpSession session) {
		
		Long idOfSession = (Long)session.getAttribute("loggedIn");
		model.addAttribute("idOfSession", idOfSession);
		
		Category singleCategory = this.categoryService.viewOne(id);
		model.addAttribute("singleCategory", singleCategory);
		
		List<Category> allCategories = this.categoryService.findAllCategories();
		model.addAttribute("listOfAllCategories", allCategories);
		
		model.addAttribute("categoryForm", new Category());
		
		return "viewOneCategoryWithProducts.jsp";

	}
	
	
	@PostMapping("/addCategory/{id}")
	public String addProductToCategory(@PathVariable("id") Long productId, @RequestParam("categoryId") Long categoryId) {
		System.out.println("category id --> " + categoryId);
		System.out.println("product id --> " + productId);
		
		Category category = this.categoryService.viewOne(categoryId);
		Product product = this.productService.viewOne(productId);
		
	
		List<Product>categoryList = category.getProducts();
		categoryList.add(product);
		System.out.println(category.getProducts());
		
		category.setProducts(categoryList);
		
		this.categoryService.updateCategory(category);
		
		
		return "redirect:/dashboard";
	}
	
	
//	----> Delete One by ID <----
	@GetMapping("/category/delete/{id}")
	public String deleteOne(@PathVariable("id") Long id) {
		this.categoryService.deleteOne(id);
		return "redirect:/dashboard";
		
	}
	

}
