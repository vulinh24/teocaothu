package com.shopteocaothu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ThongKe {
	
	private Long countDay;
	
	private Long sumDay;
	
	private Long countMonth;
	
	private Long sumMonth;
	
	private Long monthInterest;
	
	private Long totalInterest;
}
