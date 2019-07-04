package org.iii.seaotter.jayee.web;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

	@Autowired
	private SecurityUserService securityUserService;
	@Autowired
	private PasswordEncoder passwordEncorder;

	@GetMapping("/login")
	public String loginPage() {
		System.out.println(passwordEncorder.encode("admin"));
		return "/user/user-login";
	}

	@PostMapping("/signUp")
	public String singUp(@RequestParam("account") String account, @RequestParam("password") String password) {
		SecurityUser securityUser = new SecurityUser();
		securityUser.setAccount(account);
		securityUser.setPassword(passwordEncorder.encode(password));
		System.out.println(securityUser);
		securityUserService.signUp(securityUser);
		return "/admin/artist/list";
	}

}
