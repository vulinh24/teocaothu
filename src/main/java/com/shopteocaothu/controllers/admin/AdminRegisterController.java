package com.shopteocaothu.controllers.admin;

import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.RoleOfUser;
import com.shopteocaothu.entities.User;
import com.shopteocaothu.entities.primarykey.PKOfRoleUser;
import com.shopteocaothu.repositories.RoleUserRepository;
import com.shopteocaothu.repositories.UserRepository;

@Controller
public class AdminRegisterController {

	@Autowired
	UserRepository userRepo;

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	RoleUserRepository roleUserRepository;

	@RequestMapping(value = { "/registion" }, method = RequestMethod.POST)
	public String registion(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		try {
			String username = request.getParameter("reg_username");
			String password = request.getParameter("reg_pass");
			String password_again = request.getParameter("reg_repass");
			String phone = request.getParameter("reg_phone");
			User user = userRepo.findByUsername(username);
			if (user == null) {
				user = new User();
				if (password.equals(password_again)) {
					user.setUsername(username);
					user.setPassword(passwordEncoder.encode(password));
					user.setCreatedDate(Date.valueOf(LocalDate.now()));
					user.setPhone(phone);
					user.setEnabled(true);
				} else {
					model.addAttribute("notsimilar", true);
					return "redirect:/login?notsimilar=true";
				}
				user = userRepo.save(user);
				PKOfRoleUser pk = new PKOfRoleUser(2, user.getId());
				roleUserRepository.save(new RoleOfUser(pk));
				model.addAttribute("successr", true);
				return "redirect:/login?successr=true";
			} else {
				model.addAttribute("userexist", true);
				return "redirect:/login?userexist=true";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@RequestMapping(value = { "/hien-thi-loi-neu-khong-co-quen" }, method = RequestMethod.GET)
	public String accessDenied(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		return "back-end/accessDenied";
	}
}
