package com.shopteocaothu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
