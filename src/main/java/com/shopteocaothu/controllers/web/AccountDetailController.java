package com.shopteocaothu.controllers.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.Account;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.services.CommonService;

@Controller
public class AccountDetailController {
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	AccountRepository accountRepository;
	
	@RequestMapping(value = "/acc-detail/{id}", method = RequestMethod.GET)
	public String index(Model model,@PathVariable(name = "id") Integer id) {
		try {
			commonService.render(model);
			Account acc = accountRepository.getById(id);
			model.addAttribute("account", acc);
			model.addAttribute("images", acc.getAccountImages());
			model.addAttribute("accounts", accountRepository.findBySellPriceGreaterThan(acc.getSellPrice(),PageRequest.of(0, 8)));
			model.addAttribute("skins", acc.getSkins());
			
			return "front-end/account";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
