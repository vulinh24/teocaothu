package com.shopteocaothu.controllers.admin;

import java.io.File;
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
import com.shopteocaothu.entities.Banner;
import com.shopteocaothu.repositories.BannerRepository;
import com.shopteocaothu.services.CommonService;

@Controller
public class AdminBannerController {

	@Autowired
	private BannerRepository bannerRepo;
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value = { "/admin/banners" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("banners", bannerRepo.findAll());
		return "back-end/view_banners";
	}

	@RequestMapping(value = { "/admin/banner-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("banner", new Banner());
		return "back-end/insert_banner";
	}

	@Transactional
	@RequestMapping(value = {"/admin/banner-add"}, method = RequestMethod.POST )
	public String add(@RequestParam(name = "banner_image") MultipartFile files,@ModelAttribute Banner banner, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		try {
		Banner newbanner = null;
		if (banner.getId() != null) {
			newbanner = bannerRepo.getById(banner.getId());
			if (files == null ) newbanner.setImage(newbanner.getImage());
			else {
				File oldImg = new File(WebConstants.IMG_URL + newbanner.getImage());
				oldImg.delete();
				String url = files.getOriginalFilename() ;
				files.transferTo(new File(WebConstants.IMG_URL + url));
				newbanner.setImage(url);
			}
			newbanner.setName(banner.getName());
			bannerRepo.save(newbanner);
		} else {
			if (files != null) {
				String url = files.getOriginalFilename();
				banner.setImage(url);
				files.transferTo(new File(WebConstants.IMG_URL + url));
			}
			List<Banner> old = bannerRepo.findAll();
			if (!old.isEmpty()) {
				Banner oldb = old.get(0);
				new File(WebConstants.IMG_URL + oldb.getImage()).delete();
				bannerRepo.delete(oldb);
			}
			bannerRepo.save(banner);
		}
		commonService.update();
		return "redirect:/admin/banners";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/banners/{id}" }, method = RequestMethod.GET)
	public String savebanner(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Banner banner = bannerRepo.findById(id).get();

			model.addAttribute("banner", banner);
			return "back-end/insert_banner";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/banners-delete/{id}" }, method = RequestMethod.GET)
	public String deletebanner(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Banner banner = bannerRepo.getById(id);
			File img = new File(WebConstants.IMG_URL + banner.getImage());
			img.delete();
			bannerRepo.delete(banner);
			commonService.update();
			return "redirect:/admin/banners";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
