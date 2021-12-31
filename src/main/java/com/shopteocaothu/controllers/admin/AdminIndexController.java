package com.shopteocaothu.controllers.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.CategoryRepository;
import com.shopteocaothu.repositories.SelledAccRepository;
import com.shopteocaothu.repositories.UserRepository;

@Service
@RequestMapping(value = { "/admin" })
public class AdminIndexController {

	@Autowired
	AccountRepository acccountRepository;

	@Autowired
	UserRepository userRepository;

	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	SelledAccRepository selledAccRepository;
	
	@GetMapping
	public String index(Model model, HttpServletRequest request) {
		try {
			model.addAttribute("qualityOfProduct", acccountRepository.count());
			model.addAttribute("qualityOfSelledProduct", selledAccRepository.count());
			model.addAttribute("qualityOfUser", userRepository.count());
			model.addAttribute("qualityOfCategory", categoryRepository.count());
			model.addAttribute("countDay", selledAccRepository.countByDate());
			model.addAttribute("countMonth", selledAccRepository.countByMonth());
			model.addAttribute("sumDay", selledAccRepository.sumByDate());
			model.addAttribute("sumMonth", selledAccRepository.sumByMonth());
			return "back-end/index";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

}
