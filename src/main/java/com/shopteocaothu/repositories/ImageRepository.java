package com.shopteocaothu.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Account;
import com.shopteocaothu.entities.AccountImages;
@Repository
public interface ImageRepository extends JpaRepository<AccountImages, Integer>{
	
	public List<AccountImages> findByAccount(Account account);
}
