package com.shopteocaothu.entities.primarykey;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PKOfSkin implements Serializable {

	private static final long serialVersionUID = 5513264684521226663L;

	@Column(name = "account_id")
	private Integer accountId;

	@Column(name = "skin_id")
	private Integer skinId;
}
