package com.shopteocaothu.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopteocaothu.SolveException.CustomException;
import com.shopteocaothu.entities.Role;
import com.shopteocaothu.entities.User;
import com.shopteocaothu.repositories.RoleRepository;
import com.shopteocaothu.repositories.UserRepository;

@Controller
public class AdminManageAdminController {

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = { "/admin/decentralization" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		Role role = roleRepository.findByName("ROLE_ADMIN");
		model.addAttribute("users", role.getUsers());
		return "back-end/view_admins";
	}

	@RequestMapping(value = { "/admin/decentralization-add" }, method = RequestMethod.GET)
	public String viewadd(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {

		String state = request.getParameter("notfound");
		if (state != null)
			model.addAttribute("notfound", true);
		return "back-end/insert_admin";
	}

	@Transactional
	@RequestMapping(value = { "/admin/decentralization-add" }, method = RequestMethod.POST)
	public String add(final ModelMap model, final HttpServletRequest request, final HttpServletResponse Response)
			throws Exception {
		try {
			String username = request.getParameter("username");
			Role role = roleRepository.findByName("ROLE_ADMIN");
			User user = userRepository.findByUsername(username);
			if (user == null) {
				return "redirect:/admin/decentralization-add?notfound=true";
			} else {
				List<Role> roles = user.getRoles();
				roles.add(role);
				return "redirect:/admin/decentralization";
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}

	@Transactional
	@RequestMapping(value = { "/delete-admin/{id}" }, method = RequestMethod.GET)
	public String delete(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse Response) throws Exception {
		try {
			Role role = roleRepository.findByName("ROLE_ADMIN");
			User user = userRepository.getById(id);
			List<Role> roles = user.getRoles();
			roles.remove(role);
			return "redirect:/admin/decentralization";
		} catch(Exception e) {
			e.printStackTrace();
			throw new CustomException();
		}
	}
}
