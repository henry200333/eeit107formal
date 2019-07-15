package org.iii.seaotter.jayee.web;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.dao.SecurityRoleDao;
import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private SecurityUserService securityUserService;

	@Autowired
	private SecurityRoleDao securityRoleDao;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
//	@RequestMapping("/index")
//	public String index() {
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if (!(principal.toString().equals("anonymousUser"))) {
//			Collection<? extends GrantedAuthority> roles = ((UserDetails) principal).getAuthorities();
//
//			for (GrantedAuthority grantedAuthority : roles) {
//				if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
//					return "redirect:/admin/artist/list";
//				}
//				return "index";
//			}
//		}
//		return "index";
//	}

	@GetMapping("/login")
	public String signin() {
		return "signin";
	}

	@GetMapping("/register")
	public String signup() {
		return "signup";
	}
	
	@GetMapping("/logout")
	public String signout(HttpServletRequest req) throws ServletException {
		req.logout();
		return "redirect:/";
	}
	
//	@GetMapping(value= {"/login", "/index","/"})
//	public String loginPage() {
//		return "/user/index";
//	}

	@PostMapping("/register")
	public String register(@RequestParam("username") String account, @RequestParam("password") String rawPassword,
			@RequestParam("email") String mail) {
		if (null != account && null != rawPassword) {
			if (null == securityUserService.loadUserByUsername(account)) {
				SecurityUser user = new SecurityUser();
				String password = passwordEncoder.encode(rawPassword);
				user.setAccount(account);
				user.setPassword(password);
				user.setMail(mail);
				user.setEnabled(true);

				Set<SecurityRole> roles = new HashSet<SecurityRole>();
				roles.add(securityRoleDao.findByCode("ROLE_USER"));
				user.setRoles(roles);
				System.out.println(user);
				securityUserService.signUp(user);
				return "index";
			}
		}
		return "index";
	}
}
