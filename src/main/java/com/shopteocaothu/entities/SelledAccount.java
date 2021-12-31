package com.shopteocaothu.entities;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_selled_accounts")
public class SelledAccount implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 6660118369405824909L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "ingame", length = 500, nullable = false)
	private String ingame;

	@Column(name = "ịmport_price", nullable = false)
	private Integer importPrice;

	@Column(name = "sell_price", nullable = false)
	private Integer sellPrice;

	@JsonIgnore
	@Column(name = "selled_date", nullable = false)
	private LocalDateTime selledDate;
	
	@Column(name = "selled_by", nullable = false, length = 100)
	private String selledBy;

}
