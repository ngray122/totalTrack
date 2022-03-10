package com.gray.javaproject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gray.javaproject.models.Category;



@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

	Optional<Category> findByCategoryName(String categoryName);

}
