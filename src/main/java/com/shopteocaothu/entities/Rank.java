package com.shopteocaothu.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_ranks")
public class Rank implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5851976911210048890L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name")
	private String name;
	
	@Column(name = "image")
	private String image;
	
	@OneToMany(mappedBy = "rank")
	List<Account> accounts;
	
	@PreRemove
	void setForeignKeyNull() {
		List<Account> accs = this.getAccounts();
		for (Account p : accs) {
			p.setRank(null);
		}
	}
	
}
