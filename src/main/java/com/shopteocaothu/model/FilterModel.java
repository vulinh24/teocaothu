package com.shopteocaothu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FilterModel {
	private Integer category = 0;
	private Integer rank = 0;
	private Integer price = 0;
	private Integer sort = 0;
	private Integer currenPage = 1;
	private Integer totalPage = 1;
	private String skin;
}
