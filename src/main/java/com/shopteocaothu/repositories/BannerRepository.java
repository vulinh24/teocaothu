package com.shopteocaothu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Banner;

@Repository
public interface BannerRepository extends JpaRepository<Banner, Integer>{

}
