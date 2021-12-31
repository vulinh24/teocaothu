package com.shopteocaothu.controllers.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopteocaothu.services.CommonService;

@Service
@RequestMapping(value = { "/login" })
public class AdminLoginController {
	
	@Autowired
	CommonService commonService;
	
	@GetMapping
	public String getLogin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		commonService.render(model);
		
		Map<String, String[]> testparam =  request.getParameterMap();
		if (testparam.isEmpty()) {
			String preUrl = request.getHeader("Referer");
			request.getSession().setAttribute("preURL", preUrl);
			return "front-end/login";
		} else {
			return "front-end/login";
		}
	}
}
