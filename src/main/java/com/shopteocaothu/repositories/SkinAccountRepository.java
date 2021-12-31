package com.shopteocaothu.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.SkinOfAccount;
import com.shopteocaothu.entities.primarykey.PKOfSkin;

@Repository
public interface SkinAccountRepository extends JpaRepository<SkinOfAccount, PKOfSkin>{
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM SkinOfAccount sa WHERE sa.pk.accountId = ?1")
	public int deleteByAccount(Integer accountId);
	
	@Transactional
	@Modifying
	@Query(value = "DELETE FROM SkinOfAccount sa WHERE sa.pk.skinId = ?1")
	public int deleteBySkin(Integer skinId);
}
