package com.gray.javaproject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gray.javaproject.models.Product;
import com.gray.javaproject.models.User;


@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
	
	Optional<Product> findByProductName(String productName);

}
