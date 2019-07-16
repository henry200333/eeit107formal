package org.iii.seaotter.jayee.web;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.seaotter.jayee.dao.SecurityRoleDao;
import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/{username}")
	public String userPage(@PathVariable String username) {
		System.out.println(username);
		return "/user/userpage";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

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

	@PostMapping("/register")
	public String register(@RequestParam("username") String account, @RequestParam("password") String rawPassword,
			@RequestParam("email") String mail,  HttpServletRequest request, HttpServletResponse response) {
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
				
				authenticateUserAndSetSession(user, rawPassword, request);
				
				return "index";
			}
		}
		return "index";
	}
	
	@Autowired
    protected AuthenticationManager authenticationManager;
	
	private void authenticateUserAndSetSession(SecurityUser user, String rawPassword, HttpServletRequest request) {
		String username = user.getUsername();
        String password = rawPassword;
        
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
		
        request.getSession();
        
        token.setDetails(new WebAuthenticationDetails(request));
        Authentication authenticatedUser = authenticationManager.authenticate(token);
        
        SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
	}
}
