package org.iii.seaotter.jayee.web;

import java.util.HashSet;
import java.util.Set;

<<<<<<< HEAD
import org.iii.seaotter.jayee.entity.SecurityRole;
=======
import org.iii.seaotter.jayee.config.SpringSecurityUserContext;
import org.iii.seaotter.jayee.config.UserContext;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.dto.RegisterDto;
>>>>>>> branch 'master' of https://github.com/henry200333/eeit107formal.git
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
<<<<<<< HEAD
import org.springframework.security.crypto.password.PasswordEncoder;
=======
import org.springframework.security.core.context.SecurityContextHolder;
>>>>>>> branch 'master' of https://github.com/henry200333/eeit107formal.git
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
<<<<<<< HEAD
	private SecurityUserService securityUserService;

=======
	private SecurityUserDao securityUserDao;
	
>>>>>>> branch 'master' of https://github.com/henry200333/eeit107formal.git
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
				role
				
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
