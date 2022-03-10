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
import org.springframework.web.bind.annotation.PutMapping;

import com.gray.javaproject.models.Category;
import com.gray.javaproject.models.Product;
import com.gray.javaproject.services.CategoryService;
import com.gray.javaproject.services.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
//	----> View Create Form <----
	@GetMapping("/product/new")
	public String viewAddProductForm(Model model, HttpSession session) {
		
		Long id = (Long)session.getAttribute("loggedIn");
//		System.out.println("Session id --> " + id);
		model.addAttribute("id", id);
		model.addAttribute("newProduct", new Product());
		model.addAttribute("categoryForm", new Category());
		
		List<Category> listOfAllCategories = this.categoryService.findAllCategories();
		model.addAttribute("listOfAllCategories", listOfAllCategories);
		
		Product singleProduct = this.productService.viewOne(id);
		model.addAttribute("singleProduct", singleProduct);
		
		if(id == null) {
			return "redirect:/";
		}
		return "addNewProduct.jsp";
	}
	
	
//	----> Post Create Form <----
	@PostMapping("/product/create")
	public String addNewProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		this.productService.productNameIsPresent(product, result);
		
		if (result.hasErrors()) {
			model.addAttribute("product", product);
			model.addAttribute("categoryForm", new Category());
			System.out.println("Err for create new product => " + result);
			return "addNewProduct.jsp";
		} else {
			this.productService.addNewProduct(product, result);
			return "redirect:/dashboard";
		}
	}
	
	
	
//	----> View One <----
	@GetMapping("/products/detail/{id}")
	public String viewOne(@PathVariable("id") Long id, Model model,  HttpSession session) {
		
		Long idOfSession = (Long)session.getAttribute("loggedIn");
		model.addAttribute("idOfSession", idOfSession);
		
		Product singleProduct = this.productService.viewOne(id);
		model.addAttribute("singleProduct", singleProduct);
		
		List<Product> allProducts = this.productService.findAllProducts();
		model.addAttribute("allProducts",allProducts);
		
		List<Category> allCategories = this.categoryService.findAllCategories();
		model.addAttribute("listOfAllCategories" ,allCategories);
		
		model.addAttribute("categoryForm", new Category());

		
		return "viewOneProduct.jsp";

	}
	
	
	
	
//	----> View Edit Show Form only in session <----
	@GetMapping("/products/edit/{product_id}")
	public String viewEditForm(@PathVariable("product_id") Long product_id, Model model, HttpSession session) {
		
		Long idOfSession = (Long)session.getAttribute("loggedIn");
		
		model.addAttribute("loggedInUser", idOfSession);
		
		Product product = this.productService.viewOne(product_id);
		Long productCreatorId = product.getUser().getId();
		System.out.println(String.format("Session id: %s, Product Creator id: %s", idOfSession, productCreatorId));
		model.addAttribute("editForm", product);
//		edit not working with this added
		model.addAttribute("categoryForm", new Category());
		
		List<Category> allCategories = this.categoryService.findAllCategories();
		model.addAttribute("allCategories", allCategories);
		
//		If session id does not match user trying to edit, redirect to home
		if(idOfSession == productCreatorId) {
			System.out.println("inside the if statement");
			return "editOneProduct.jsp";
		} else {
			return "redirect:/dashboard";
		}
	
	}
	
	
	
//	----> Put/Update <----
	@PutMapping("/product/update/{id}")
	public String updateProduct(@Valid @ModelAttribute("editForm") Product product, BindingResult result) {

		if (result.hasErrors()) {
			return "editOneProduct.jsp";
		} else {
			this.productService.updateProduct(product);
			return "redirect:/dashboard";
		}

	}
	

	
//	----> Delete One by ID <----
	@GetMapping("/product/delete/{id}")
	public String deleteOneProduct(@PathVariable("id") Long id) {
		this.productService.deleteOne(id);
		return "redirect:/dashboard";
		
	}

}
