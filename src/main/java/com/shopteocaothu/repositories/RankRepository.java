package com.shopteocaothu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopteocaothu.entities.Rank;

@Repository
public interface RankRepository extends JpaRepository<Rank, Integer>{

}
