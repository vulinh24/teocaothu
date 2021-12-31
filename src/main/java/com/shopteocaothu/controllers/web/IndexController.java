package com.shopteocaothu.controllers.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.BannerRepository;
import com.shopteocaothu.repositories.CategoryRepository;
import com.shopteocaothu.services.CommonService;


@Controller
@RequestMapping(value = {"/" ,"/home"})
public class IndexController {
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	BannerRepository bannerRepository;
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	CommonService commonService;
	
	@GetMapping
	public String index(Model model,final HttpServletRequest request,final HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			//session.removeAttribute(ShopController.FILTER_MODEL); //  = final FILTER_MODEL in shop controller
			
			model.addAttribute("categories", categoryRepository.findAll());
			
			commonService.render(model);
			
			String preURL = (String) session.getAttribute("preURL");
			if (preURL != null && !preURL.startsWith("/admin/")) {
				session.removeAttribute("preURL");
				response.sendRedirect(request.getContextPath() + preURL);
				return null;
			} else {
				session.removeAttribute(preURL);
				return "front-end/index";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value="/error" , method = RequestMethod.GET)
	public String error() {
		return "front-end/error";
	}
	
}
