package com.shopteocaothu.controllers.admin;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.shopteocaothu.entities.Category;
import com.shopteocaothu.repositories.CategoryRepository;
import com.shopteocaothu.services.MyUserDetail;

@Controller
public class AdminCategoryController {

	@Autowired
	private CategoryRepository categoryRepo;

	@RequestMapping(value = { "/admin/categories" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("categories", categoryRepo.findAll());
		return "back-end/view_categories";
	}

	@RequestMapping(value = { "/admin/category-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("category", new Category());
		return "back-end/insert_category";
	}

	@Transactional
	@RequestMapping(value = {"/admin/category-add"}, method = RequestMethod.POST )
	public String add(@RequestParam(name = "cate_image") MultipartFile files,@ModelAttribute Category category, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		try {
		MyUserDetail userDetail = (MyUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Category newCategory = null;
		if (category.getId() != null) {
			newCategory = categoryRepo.getById(category.getId());
			if (files == null ) newCategory.setImage(newCategory.getImage());
			else {
				File oldImg = new File(WebConstants.IMG_URL + newCategory.getImage());
				oldImg.delete();
				String url = files.getOriginalFilename() ;
				files.transferTo(new File(WebConstants.IMG_URL + url));
				newCategory.setImage(url);
			}
			newCategory.setName(category.getName());
			newCategory.setCreatedDate(Date.valueOf(LocalDate.now()));
			newCategory.setCreatedBy(userDetail.getUser().getUsername());
			categoryRepo.save(newCategory);
		} else {
			if (files != null) {
				String url = files.getOriginalFilename();
				category.setImage(url);
				files.transferTo(new File(WebConstants.IMG_URL + url));
			}
			category.setCreatedBy(userDetail.getUser().getUsername());
			category.setCreatedDate(Date.valueOf(LocalDate.now()));
			categoryRepo.save(category);
		}
		
		return "redirect:/admin/categories";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/categories/{id}" }, method = RequestMethod.GET)
	public String saveCategory(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Category category = categoryRepo.findById(id).get();

			model.addAttribute("category", category);
			return "back-end/insert_category";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/categories-delete/{id}" }, method = RequestMethod.GET)
	public String deleteCategory(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Category cate = categoryRepo.getById(id);
			File img = new File(WebConstants.IMG_URL + cate.getImage());
			img.delete();
			categoryRepo.delete(cate);
			return "redirect:/admin/categories";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
