package com.shopteocaothu.controllers.admin;

import java.io.File;

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
import com.shopteocaothu.entities.Rank;
import com.shopteocaothu.repositories.RankRepository;

@Controller
public class AdminRankController {

	@Autowired
	private RankRepository rankRepo;

	@RequestMapping(value = { "/admin/ranks" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("ranks", rankRepo.findAll());
		return "back-end/view_ranks";
	}

	@RequestMapping(value = { "/admin/rank-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		model.addAttribute("rank", new Rank());
		return "back-end/insert_rank";
	}

	@Transactional
	@RequestMapping(value = {"/admin/rank-add"}, method = RequestMethod.POST )
	public String add(@RequestParam(name = "rank_image") MultipartFile files,@ModelAttribute Rank rank, final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response ) throws Exception{
		try {
		Rank newRank = null;
		if (rank.getId() != null) {
			newRank = rankRepo.getById(rank.getId());
			if (files == null ) newRank.setImage(newRank.getImage());
			else {
				File oldImg = new File(WebConstants.IMG_URL + newRank.getImage());
				oldImg.delete();
				String url = files.getOriginalFilename() ;
				files.transferTo(new File(WebConstants.IMG_URL + url));
				newRank.setImage(url);
			}
			newRank.setName(rank.getName());
			rankRepo.save(newRank);
		} else {
			if (files != null) {
				String url = files.getOriginalFilename();
				rank.setImage(url);
				files.transferTo(new File(WebConstants.IMG_URL + url));
			}
			
			rankRepo.save(rank);
		}
		
		return "redirect:/admin/ranks";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/admin/ranks/{id}" }, method = RequestMethod.GET)
	public String saveRank(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Rank rank = rankRepo.findById(id).get();

			model.addAttribute("rank", rank);
			return "back-end/insert_rank";
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/admin/ranks-delete/{id}" }, method = RequestMethod.GET)
	public String deleteRank(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		try {
			Rank rank = rankRepo.getById(id);
			File img = new File(WebConstants.IMG_URL + rank.getImage());
			img.delete();
			rankRepo.delete(rank);
			return "redirect:/admin/ranks";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
