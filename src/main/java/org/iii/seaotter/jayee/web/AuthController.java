package org.iii.seaotter.jayee.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

	@Autowired
	private SecurityUserService securityUserService;

	@GetMapping("/login")
	public String signin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "Username or Password is incorrect !!";
		}
		if (logout != null) {
			errorMessage = "You have been successfully logged out !!";
		}
		if (errorMessage != null)
			model.addAttribute("errorMessge", errorMessage);

		return "signin";
	}

	@GetMapping("/logout")
	public String signout(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@GetMapping("/register")
	public String signup() {
		return "signup";
	}

	@PostMapping("/register")
	public String register(@RequestParam("username") String account, @RequestParam("password") String rawPassword,
			@RequestParam("email") String mail, HttpServletRequest request, HttpServletResponse response, Model model) {

		SecurityUser existingUser = securityUserService.findByMailIgnoreCase(mail);
		if (existingUser != null) {
			return "signup";
		}

		SecurityUser user = securityUserService.registerNewUserAccount(account, rawPassword, mail);
		securityUserService.verifyMail(user);

		model.addAttribute("mail", mail);

		return "successfulRegisteration";

	}

	@RequestMapping(value = "/confirm-account", method = { RequestMethod.GET, RequestMethod.POST })
	public String confirmUserAccount(@RequestParam("token") String confirmationToken, Model model) {
		model.addAttribute("message", securityUserService.checkConfirmationToken(confirmationToken));
		return "accountVerified";
	}

//	@GetMapping("/register")
//	public String signup() {
//		return "signup";
//	}
//	
//	@PostMapping("/register")
//	public String register(@RequestParam("username") String account, @RequestParam("password") String rawPassword,
//			@RequestParam("email") String mail, HttpServletRequest request, HttpServletResponse response, Model model) {
//		if (null != account && null != rawPassword) {
//
//			if (null == securityUserService.loadUserByUsername(account)) {
//				RegisterUser user1 = new RegisterUser();
//				user1.setAccount(account);
//				String password = passwordEncoder.encode(rawPassword);
//				user1.setPassword(password);
//				user1.setMail(mail);
//
//				SecurityUser user = new SecurityUser();
//				BeanUtils.copyProperties(user1, user);
//
//				Set<SecurityRole> roles = new HashSet<SecurityRole>();
//				roles.add(securityRoleDao.findByCode("ROLE_USER"));
//				user.setRoles(roles);
//				securityUserService.signUp(user);
//
//				authenticateUserAndSetSession(user, rawPassword, request);
//				model.addAttribute("userParam", user);
//				return "/user/edit";
//			}
//		}
//		return "signup";
//	}
//
//	@Autowired
//	protected AuthenticationManager authenticationManager;
//
//	private void authenticateUserAndSetSession(SecurityUser user, String rawPassword, HttpServletRequest request) {
//		String username = user.getUsername();
//		String password = rawPassword;
//
//		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
//
//		request.getSession();
//
//		token.setDetails(new WebAuthenticationDetails(request));
//		Authentication authenticatedUser = authenticationManager.authenticate(token);
//
//		SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
//	}

}
