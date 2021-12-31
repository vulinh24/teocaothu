package com.shopteocaothu.entities.primarykey;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * khóa chính của bảng Cart
 * @author LinhVu
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class PKOfCart implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3567798310776512705L;

	@Column(name = "user_id",nullable = false)
	private Integer userId;
	
	@Column(name="account_id",nullable = false)
	private Integer accountId;
}
