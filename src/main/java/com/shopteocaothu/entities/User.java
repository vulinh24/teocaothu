package com.shopteocaothu.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tbl_users")
public class User extends ParentEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8688323980624037918L;
	
	@Column(name = "enabled", nullable = false)
	private boolean enabled = Boolean.TRUE;
	
	@Column(name = "username", length = 60, nullable = false)
	private String username;
	
	@Column(name = "password", length = 60, nullable = false)
	private String password;
	
	@Column(name = "phone", length = 15, nullable = true)
	private String phone;
	
	@Column(name = "money",nullable = true)
	private Integer money = 0;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	List<Role> roles;
	
	@ManyToMany(fetch = FetchType.LAZY) 
	@JoinTable(name = "tbl_favorite_accounts", 
				joinColumns = @JoinColumn(name = "user_id"),
				inverseJoinColumns = @JoinColumn(name="account_id"))
	List<Account> fAccounts; // focus
	
	@OneToMany(mappedBy = "user")
	List<MoneyOfUser> buys;
	
}
