package com.shopteocaothu.repositories;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Account;
@Repository
public interface AccountRepository extends JpaRepository<Account, Integer>{
	
	@Query(value = "FROM Account acc WHERE acc.sellPrice - ?1 BETWEEN -300000 AND 300000 ")
	List<Account> findBySellPriceGreaterThan(int price, PageRequest page);
	
}
