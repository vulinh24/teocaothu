package com.shopteocaothu.entities;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.shopteocaothu.entities.primarykey.PKOfSkin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table (name = "tbl_skin_of_acc")
public class SkinOfAccount implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5193589957091905284L;
	
	@EmbeddedId
	private PKOfSkin pk;
}
