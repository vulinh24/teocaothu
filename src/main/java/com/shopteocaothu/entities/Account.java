package com.shopteocaothu.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "tbl_accounts")
public class Account extends ParentEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4890711041201392878L;

	@Column(name = "ingame", length = 500, nullable = false)
	private String ingame;

	@Column(name = "level", nullable = false)
	private Integer level;

	@Column(name = "description", nullable = true, columnDefinition = "TEXT")
	private String description;

	@Column(name = "num_champ", nullable = false)
	private Integer numOfChamp;

	@Column(name = "ịmport_price", nullable = false)
	private Integer importPrice;

	@Column(name = "sell_price", nullable = false)
	private Integer sellPrice;

	@Column(name = "selled", nullable = false)
	private Boolean isSelled = false;
	
	@Column(name = "num_skin", nullable = false)
	private Integer numSkin = 0;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "tbl_skin_of_acc",
			joinColumns =  @JoinColumn(name = "account_id"),
			inverseJoinColumns = @JoinColumn(name = "skin_id") 
	)
	List<Skin> skins;
	
	@ManyToOne
	@JoinColumn(name = "category_id", nullable = true)
	private Category category;

	@ManyToOne
	@JoinColumn(name = "rank_id", nullable = true)
	private Rank rank;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
	private List<AccountImages> accountImages;

	@ManyToMany(mappedBy = "fAccounts", fetch = FetchType.LAZY)
	List<User> likedUsers;
}
