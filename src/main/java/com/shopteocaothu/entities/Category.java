package com.shopteocaothu.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "tbl_categorys")
public class Category extends ParentEntity {

	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "image", nullable = false)
	private String image;
	
	@Column(name = "description", nullable = false)
	private String description = "";
	
	@OneToMany(mappedBy = "category")
	List<Account> accounts;
	
	@PreRemove
	void setForeignKeyNull() {
		List<Account> accs = this.getAccounts();
		for (Account p : accs) {
			p.setCategory(null);
		}
	}
}
