package org.iii.seaotter.jayee.web;

import org.iii.seaotter.jayee.entity.SecurityRole;
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
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private SecurityUserService securityUserService;

	@GetMapping("/login")
	public String loginPage() {
		return "/user/index";
	}

	@PostMapping("/register")
	public String register(@RequestParam("register_account")String account, @RequestParam("register_password")String rawPassword) {
		if (null != account && null != rawPassword) {
			if (null == securityUserService.loadUserByUsername(account)) {
				SecurityUser user = new SecurityUser();
				System.out.println(account);
				System.out.println(rawPassword);
				String password = passwordEncoder.encode(rawPassword);
				user.setAccount(account);
				user.setPassword(password);
				user.setEnabled(true);
				
				SecurityRole role = new SecurityRole();
				
//				securityUserService.signUp(user);
//				SecurityRole role = new SecurityRole();
//				role.setAccount(account);
//				role.setCode("ROLE_USER");
//				Set<SecurityUser> users = new HashSet<SecurityUser>();
//				users.add(user);
//				role.setUsers(users);
			}
		}
		return "/user/index";
	}
}
