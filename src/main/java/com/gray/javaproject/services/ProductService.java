package com.gray.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.gray.javaproject.models.Product;
import com.gray.javaproject.repositories.ProductRepository;


@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepo;

//	get all 
	public List<Product> findAllProducts() {
		return (List<Product>) this.productRepo.findAll();
	}

//	add new
	public Product addNewProduct(Product product, BindingResult result) {

		Optional<Product> newProduct = productRepo.findByProductName(product.getProductName());

		if (newProduct.isPresent()) {
			result.rejectValue("productName", "Product Present", "Item name is already taken, choose again");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return productRepo.save(product);
		}
	}
	
	
	
//	is duplicate?
	public Product productNameIsPresent(Product product, BindingResult result) {

		Optional<Product> newProduct = productRepo.findByProductName(product.getProductName());

		if (newProduct.isPresent()) {
			result.rejectValue("productName", "Product Present", "Item name is already taken, choose again");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return null;
		}
	}

//	update
	public Product updateProduct(Product p) {
		return this.productRepo.save(p);
	}

//	find one by id
	public Product viewOne(Long id) {
		return this.productRepo.findById(id).orElse(null);
	}

//	delete by id
	public void deleteOne(Long id) {
		this.productRepo.deleteById(id);
	}


}
