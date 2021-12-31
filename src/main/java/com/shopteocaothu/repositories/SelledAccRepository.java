package com.shopteocaothu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.SelledAccount;

@Repository
public interface SelledAccRepository extends JpaRepository<SelledAccount, Integer>{
	
	@Query(value = "SELECT count(*) FROM SelledAccount sa WHERE day(sa.selledDate) = day(sysdate())")
	Long countByDate();
	
	@Query(value = "SELECT count(*) FROM SelledAccount sa WHERE month(sa.selledDate) = month(sysdate())")
	Long countByMonth();
	
	@Query(value = "SELECT sum(sa.sellPrice) FROM SelledAccount sa WHERE day(sa.selledDate) = day(sysdate())")
	Long sumByDate();
	
	@Query(value = "SELECT sum(sa.sellPrice) FROM SelledAccount sa WHERE month(sa.selledDate) = month(sysdate())")
	Long sumByMonth();
	
	@Query(value = "SELECT sum(sa.importPrice) FROM SelledAccount sa WHERE month(sa.selledDate) = month(sysdate())")
	Long sumImportMonth();
	
	@Query(value = "SELECT sum(sa.sellPrice) FROM SelledAccount sa")
	Long sumSellTotal();
	
	@Query(value = "SELECT sum(sa.importPrice) FROM SelledAccount sa")
	Long sumImportTotal();
}
