package com.shopteocaothu.controllers.admin;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopteocaothu.WebConstants;
import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.Account;
import com.shopteocaothu.entities.AccountImages;
import com.shopteocaothu.entities.SelledAccount;
import com.shopteocaothu.repositories.AccountRepository;
import com.shopteocaothu.repositories.CategoryRepository;
import com.shopteocaothu.repositories.FAccountRepository;
import com.shopteocaothu.repositories.ImageRepository;
import com.shopteocaothu.repositories.RankRepository;
import com.shopteocaothu.repositories.SelledAccRepository;
import com.shopteocaothu.repositories.SkinAccountRepository;
import com.shopteocaothu.repositories.SkinRepository;
import com.shopteocaothu.services.AccountService;
import com.shopteocaothu.services.CommonService;

@Controller
public class AdminAccountController {
	
	@Autowired
	CommonService commonService;

	@Autowired
	AccountRepository accountRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	ImageRepository imageRepository;

	@Autowired
	AccountService accountService;

	@Autowired
	FAccountRepository fAccountRepository;
	
	@Autowired
	RankRepository rankRepository;
	
	@Autowired
	SkinRepository skinRepository;
	
	@Autowired
	SkinAccountRepository skinAccRepository;
	
	@Autowired
	SelledAccRepository selledAccRepository;

	@RequestMapping(value = { "/admin/accounts" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		List<Account> accounts = accountRepository.findAll();
		model.addAttribute("accounts", accounts);
		return "back-end/view_accounts";
	}

	@RequestMapping(value = { "/admin/account-add/{id}" }, method = RequestMethod.GET)
	public String edit(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse Response) throws Exception {
		try {
			if (id == null)
				model.addAttribute("account", new Account());
			else {
				Account account = accountRepository.getById(Integer.valueOf(id));
				account.setCategory(null);
				account.setRank(null);
				model.addAttribute("account", account);
			}
			
			model.addAttribute("skins", skinRepository.findAll());
			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("ranks", rankRepository.findAll());
			return "back-end/insert_account";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/account-add" }, method = RequestMethod.GET)
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		try {
			model.addAttribute("skins", skinRepository.findAll());
			Account account = new Account();
			account.setCreatedDate(Date.valueOf(LocalDate.now()));
			model.addAttribute("account", account);
			model.addAttribute("categories", categoryRepository.findAll());
			model.addAttribute("ranks", rankRepository.findAll());
			return "back-end/insert_account";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@Transactional
	@RequestMapping(value = { "/admin/account-delete/{id}" }, method = RequestMethod.GET)
	public String deleteaccount(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Account account = accountRepository.getById(id);
			List<AccountImages> images = account.getAccountImages();
			for (AccountImages pi : images) {
				File file = new File(WebConstants.IMG_URL + pi.getPath());
				file.delete();
			}
			imageRepository.deleteAll(images);
			fAccountRepository.deleteAccount(id);
			skinAccRepository.deleteByAccount(id);
			accountRepository.deleteById(id);
			commonService.update();
			return "redirect:/admin/accounts?status=success";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@Transactional
	@RequestMapping(value = { "/admin/account-add" }, method = RequestMethod.POST)
	public String saveOrUpdateaccount(@RequestParam("account_images") MultipartFile[] accountImages,
			@ModelAttribute("account") Account account, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			accountService.save(accountImages, account,request);
			commonService.update();
			return "redirect:/admin/account-add?status=success";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@Transactional
	@RequestMapping(value = "/admin/account-selled", method = RequestMethod.GET)
	public String selledAccount(ModelMap model, HttpServletRequest request) {
		try {
			String id = request.getParameter("id");
			String price = request.getParameter("price");
			Account acc = accountRepository.getById(Integer.valueOf(id));
			SelledAccount sellacc = new SelledAccount();
			sellacc.setImportPrice(acc.getImportPrice());
			sellacc.setIngame(acc.getIngame());
			sellacc.setSelledDate(LocalDateTime.now());
			sellacc.setSelledBy((String) request.getSession().getAttribute("USER"));
			sellacc.setSellPrice(Integer.valueOf(price));
			selledAccRepository.save(sellacc);
			accountRepository.delete(acc);
			commonService.update();
			return "redirect:/admin/accounts?status=success";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
	
	@RequestMapping(value = "admin/selled-accounts" , method = RequestMethod.GET)
	public String listselled(ModelMap model, HttpServletRequest request) {
		try {
			model.addAttribute("accounts", selledAccRepository.findAll());
			return "back-end/view_selledaccounts";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
