package com.shopteocaothu.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Skin;

@Repository
public interface SkinRepository extends JpaRepository<Skin, Integer>{

	List<Skin> findByName(String name);

}
