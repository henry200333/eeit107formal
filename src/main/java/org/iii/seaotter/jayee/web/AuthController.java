package org.iii.seaotter.jayee.web;

import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthController {

	@Autowired
	SecurityUserService securityUserService;

	@GetMapping("/login")
	public String loginPage() {
		return "/user/index";
	}

	@GetMapping("/registration")
	public String showRegistrationForm() {
		return "/user/registration";
	}

	@PostMapping("/register")
	@ResponseBody
	public AjaxResponse<SecurityUser> insert(@Valid @RequestBody SecurityUser securityUser, BindingResult result) {
		System.out.println(securityUser);
		AjaxResponse<SecurityUser> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		} else {
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(securityUserService.signUp(securityUser));
			return ajaxRes;
		}
	}
}
