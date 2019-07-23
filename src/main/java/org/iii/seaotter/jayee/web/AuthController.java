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
	public String signInPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, @RequestParam(value = "reset", required = false) String reset, Model model) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "帳號或密碼有誤 !!";
		}
		if (logout != null) {
			errorMessage = "已成功登出!!";
		}
		if (reset != null) {
			errorMessage = "密碼已重新設定!!";
		}
		if (errorMessage != null)
			model.addAttribute("errorMessage", errorMessage);

		return "signin";
	}

	@GetMapping("/logout")
	public String signOutPage(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@GetMapping("/register")
	public String signup(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "此信箱已註冊過，請重新輸入";
		}
		if (errorMessage != null) {
			model.addAttribute("errorMessage", errorMessage);
		}
		return "signup";
	}

	@PostMapping("/register")
	public String register(@RequestParam("username") String account, @RequestParam("password") String rawPassword,
			@RequestParam("email") String mail, HttpServletRequest request, HttpServletResponse response, Model model) {

		SecurityUser existingUser = securityUserService.findByMailIgnoreCase(mail);
		if (existingUser != null) {
			return "redirect:/signup?error";
		}

		SecurityUser user = securityUserService.registerNewUserAccount(account, rawPassword, mail);
		securityUserService.verifyMail(user);

		model.addAttribute("mail", mail);

		return "successfulMail";

	}

	@RequestMapping(value = "/confirm-account", method = { RequestMethod.GET, RequestMethod.POST })
	public String confirmUserAccount(@RequestParam("token") String confirmationToken, Model model) {
		model.addAttribute("message", securityUserService.checkConfirmationToken(confirmationToken));
		return "accountVerified";
	}
	
	@GetMapping("/password_forgot")
	public String forgotPasswordPage(@RequestParam(value="", required=false)String error, Model model) {
		String errorMessage = null;
		if (error != null) {
			errorMessage = "您輸入的信箱有誤!";
		}
		if (errorMessage != null) {
			model.addAttribute("errorMessage", errorMessage);
		}
		return "passwordForgot";
	}
	
	@PostMapping("/password_forgot")
	public String forgotPasswordMail(@RequestParam("mail") String mail, Model model) {
		
		SecurityUser existingUser = securityUserService.findByMailIgnoreCase(mail);
		if (existingUser == null) {
			return "redirect:/password_forgot?error";
		}
		securityUserService.passwordResetMail(existingUser);
		
		model.addAttribute("mail", mail);

		return "successfulMail";
	}
	
	@RequestMapping(value="/password-reset", method = { RequestMethod.GET, RequestMethod.POST })
	public String passwordResetPage(@RequestParam("token") String passwordResetToken, Model model) {
		model.addAttribute("user", securityUserService.checkPasswordReset(passwordResetToken));
		return "passwordReset";
	}
	
	@PostMapping("/resetPassword")
	public String passwordreset(@RequestParam("username") String account, @RequestParam("password") String password,Model model) {
		securityUserService.resetPassword(account, password);
		return "redirect:/login?reset";
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
