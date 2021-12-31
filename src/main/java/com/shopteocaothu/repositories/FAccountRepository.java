package com.shopteocaothu.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.FavoriteAccount;
import com.shopteocaothu.entities.primarykey.PKOfCart;

@Repository
public interface FAccountRepository extends JpaRepository<FavoriteAccount, PKOfCart>{
	
	@Modifying
	@Transactional
	@Query(value = "DELETE FROM FavoriteAccount fp WHERE fp.pk.accountId = ?1")
	public int deleteAccount(Integer id);
	
	@Modifying
	@Transactional
	@Query(value = "DELETE FROM FavoriteAccount fp WHERE fp.pk.userId = ?1")
	public int deleteUser(Integer id);
}
