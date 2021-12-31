package com.shopteocaothu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.MoneyOfUser;

@Repository
public interface MoneyCustomerRepository extends JpaRepository<MoneyOfUser, Integer>{
	
}
