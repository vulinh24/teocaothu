package com.shopteocaothu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountModel {
	private Integer id;
	
	private String ingame;

	private Integer level;

	private Integer numOfChamp;

	private Integer sellPrice;
	
	private String category;

	private String rank;
	
	private String description;
	
	private Integer numSkin;
}
