//package com.shopteocaothu.services;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Service;
//
//import com.shopteocaothu.entities.Category;
//import com.shopteocaothu.entities.Product;
//import com.shopteocaothu.repositories.CategoryRepository;
//import com.shopteocaothu.repositories.ProductRepository;
//
//@Service
//public class WebService {
//	
//	@Autowired
//	ProductRepository productRepository;
//	
//	@Autowired
//	CategoryRepository categoryRepository;
//	
//	@Autowired
//	TagRepository tagRepository;
//	
//	@Autowired
//	CollectionRepository collectionRepository;
//	
//	public List<Product> getAllProduct() {
//		return productRepository.findAll();
//	}
//	
//	public List<Product> getAllProduct(PageRequest page) {
//		return productRepository.findAll(page).getContent();
//	}
//	
//	public List<Category> getAllCategory() {
//		return categoryRepository.findAll();
//	}
//	
//	public List<Collection> getAllCollection() {
//		return collectionRepository.findAll();
//	}
//	
//	public List<Tag> getAllTag() {
//		return tagRepository.findAll();
//	}
//}
