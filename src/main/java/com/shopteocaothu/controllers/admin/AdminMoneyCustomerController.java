package com.shopteocaothu.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.repositories.MoneyCustomerRepository;

@Controller
public class AdminMoneyCustomerController {
	
	@Autowired
	MoneyCustomerRepository moneyRepository;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/admin/add-money", method = RequestMethod.GET)
	public String viewadd(Model model) {
		try {
			
			return "back-end/insert_money";
		} catch (Exception e){
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value = "/admin/money-customers", method = RequestMethod.GET)
	public String viewupdate(Model model) {
		try {
			return "back-end/insert_money";
		} catch (Exception e){
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
}
