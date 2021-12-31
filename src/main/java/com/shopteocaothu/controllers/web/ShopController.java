package com.shopteocaothu.controllers.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.WebConstants;
import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.Account;
import com.shopteocaothu.entities.Skin;
import com.shopteocaothu.entities.User;
import com.shopteocaothu.model.FilterModel;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.CategoryRepository;
import com.shopteocaothu.repositories.RankRepository;
import com.shopteocaothu.repositories.SkinRepository;
import com.shopteocaothu.repositories.UserRepository;
import com.shopteocaothu.services.AccountService;
import com.shopteocaothu.services.CommonService;

@Controller
public class ShopController {
	/*
	 * filter model in session
	 */
	public final static String FILTER_MODEL = "filterModel";
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AccountRepository accountRepository;
	
	@Autowired
	RankRepository rankRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	SkinRepository skinRepository;
	
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String index(Model model) throws Exception{
		try {
		commonService.render(model);

		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("ranks", rankRepository.findAll());
		model.addAttribute("skins", skinRepository.findAll());
		
		String cate = request.getParameter("cate");
		FilterModel filter = new FilterModel();
		if (cate != null) filter.setCategory(Integer.valueOf(cate));
		filter.setTotalPage((int) Math.ceil((double) accountRepository.count() / WebConstants.NUM_OF_AccountS));
		model.addAttribute("filter", filter);
		model.addAttribute("accounts", accountService.filterAccount(filter));
		request.getSession().setAttribute(FILTER_MODEL, filter);
		
		return "front-end/shop";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	
	@RequestMapping(value = "/shop/filter-accounts", method = RequestMethod.POST)
	public String shopSearch(Model model, @ModelAttribute(name = "filter") FilterModel filter){
		try {
			HttpSession session = request.getSession();
			String favorite = request.getParameter("favorite");
			if (favorite != null && favorite.equals("true")) {
				String username = (String) session.getAttribute("USER");
				User user = userRepository.findByUsername(username);
				List<Account> accounts = user.getFAccounts();
				model.addAttribute("accounts", accounts);
				model.addAttribute("favorite",true);
				model.addAttribute("size", accounts.size());
				return "front-end/shop";
			}
			if (filter.getSkin() != null && !filter.getSkin().equals("")) {
				Skin skin = skinRepository.findByName(filter.getSkin()).get(0);
				return "redirect:/shop-skin?skin=" + skin.getId();
			}
			
			FilterModel old = (FilterModel) session.getAttribute(FILTER_MODEL);
			filter.setTotalPage(old.getTotalPage());
			
			commonService.render(model);
			
			model.addAttribute("accounts", accountService.filterAccount(filter));
			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("ranks", rankRepository.findAll());
			model.addAttribute("skins", skinRepository.findAll());
			model.addAttribute("filter", filter);
			
			session.setAttribute(FILTER_MODEL, filter);
			return "redirect:/shop/filter-accounts";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value = "/shop/filter-accounts", method = RequestMethod.GET)
	public String shopSearchWithPage(Model model){
		try {
			HttpSession session = request.getSession();
			String favorite = request.getParameter("favorite");
			if (favorite != null && favorite.equals("true")) {
				String username = (String) session.getAttribute("USER");
				User user = userRepository.findByUsername(username);
				List<Account> accounts = user.getFAccounts();
				model.addAttribute("accounts", accounts);
				model.addAttribute("favorite",true);
				model.addAttribute("size", accounts.size());
				return "front-end/shop";
			}
			
			FilterModel filter = (FilterModel) request.getSession().getAttribute(FILTER_MODEL);
			commonService.render(model);
			
			String page = request.getParameter("page");
			if(page != null ) filter.setCurrenPage(Integer.valueOf(page));
			model.addAttribute("accounts", accountService.filterAccount(filter));
			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("ranks", rankRepository.findAll());
			model.addAttribute("skins", skinRepository.findAll());
			model.addAttribute("filter", filter);
			
			request.getSession().setAttribute(FILTER_MODEL, filter);
			return "front-end/shop";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value="/shop-skin", method = RequestMethod.GET)
	public String findBySKin(Model model) {
		try {
		commonService.render(model);

		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("ranks", rankRepository.findAll());
		model.addAttribute("skins", skinRepository.findAll());
		FilterModel filter = new FilterModel();
		filter.setTotalPage(0);
		model.addAttribute("filter", filter);
		String id = request.getParameter("skin");
		if (id != null) {
			Skin skin = skinRepository.getById(Integer.valueOf(id));
			model.addAttribute("accounts", skin.getAccounts());
		} else {
			model.addAttribute("accounts", new ArrayList<Account>());
		}
		
		request.getSession().setAttribute(FILTER_MODEL, filter);
		
		return "front-end/shop";
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
}
