package com.shopteocaothu.services;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shopteocaothu.entities.Account;
import com.shopteocaothu.entities.Banner;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.BannerRepository;
import com.shopteocaothu.repositories.SelledAccRepository;

import lombok.Data;

@Service
@Data
public class CommonService {
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	SelledAccRepository selledAccRepository;
	
	@Autowired
	BannerRepository bannerRepository;
	
	private List<Account> accounts;
	
	private Long countAcc;
	
	private Long countSelledAcc;
	
	private Banner banner;
	
	@PostConstruct
	private void init() {
		this.accounts = accountRepository.findAll(Sort.by(Direction.DESC, "sellPrice"));
		this.countAcc = (long) accounts.size();
		this.countSelledAcc = selledAccRepository.count();
		this.banner = bannerRepository.findAll().get(0);
	}
	
	public void update() {
		this.accounts = accountRepository.findAll(Sort.by(Direction.DESC, "sellPrice"));
		this.countAcc = (long) accounts.size();
		this.countSelledAcc = selledAccRepository.count();
		this.banner = bannerRepository.findAll().get(0);
	}
	
	public void render(Model model) {
		model.addAttribute("topaccounts", accounts);
		model.addAttribute("acc", countAcc);
		model.addAttribute("sellAcc", countSelledAcc);
		model.addAttribute("banner", banner);
	}
}
