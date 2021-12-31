package com.shopteocaothu.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
@Entity
@Table(name = "tbl_account_images")
public class AccountImages implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1744078896625658189L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "path", nullable = false)
	private String path;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "account_id")
	private Account account;
}
