package com.shopteocaothu.controllers.admin;

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
import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.Skin;
import com.shopteocaothu.repositories.SkinAccountRepository;
import com.shopteocaothu.repositories.SkinRepository;

@Controller
public class AdminSkinController {

	@Autowired
	private SkinRepository skinRepo;
	
	@Autowired
	SkinAccountRepository skinAccRepository;

	@RequestMapping(value = { "/admin/skins" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("skins", skinRepo.findAll());
		return "back-end/view_skins";
	}

	@RequestMapping(value = { "/admin/skin-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("skin", new Skin());
		return "back-end/insert_skin";
	}

	@Transactional
	@RequestMapping(value = {"/admin/skin-add"}, method = RequestMethod.POST )
	public String add(@ModelAttribute Skin skin, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		try {
		Skin newSkin = null;
		if (skin.getId() != null) {
			newSkin = skinRepo.getById(skin.getId());
			newSkin.setName(skin.getName());
			skinRepo.save(newSkin);
		} else {
			skinRepo.save(skin);
		}
		
		return "redirect:/admin/skin-add?status=success";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/skins/{id}" }, method = RequestMethod.GET)
	public String saveskin(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Skin skin = skinRepo.findById(id).get();

			model.addAttribute("skin", skin);
			return "back-end/insert_skin";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/skins-delete/{id}" }, method = RequestMethod.GET)
	public String deleteskin(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			skinAccRepository.deleteBySkin(id);
			skinRepo.deleteById(id);
			return "redirect:/admin/skins?status=success";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
