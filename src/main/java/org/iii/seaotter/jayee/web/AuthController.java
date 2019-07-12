package org.iii.seaotter.jayee.web;

import java.util.HashSet;
import java.util.Set;

import org.iii.seaotter.jayee.dao.SecurityRoleDao;
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
	
	@Autowired
	private SecurityRoleDao securityRoleDao;
	
	@GetMapping(value= {"/login", "/index","/"})
	public String loginPage() {
		return "/user/index";
	}

	@PostMapping("/register")
	public String register(@RequestParam("register_account")String account, @RequestParam("register_password")String rawPassword) {
		if (null != account && null != rawPassword) {
			if (null == securityUserService.loadUserByUsername(account)) {
				SecurityUser user = new SecurityUser();
				String password = passwordEncoder.encode(rawPassword);
				user.setAccount(account);
				user.setPassword(password);
				user.setEnabled(true);
				
				Set<SecurityRole> roles = new HashSet<SecurityRole>();
				roles.add(securityRoleDao.findByCode("ROLE_USER"));
				user.setRoles(roles);
				
				securityUserService.signUp(user);
				return "/user/index";
			}
		}
		return "/user/index";
	}
}
