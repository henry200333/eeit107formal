package org.iii.seaotter.jayee.web;

import javax.validation.Valid;

import org.iii.seaotter.jayee.config.UserContext;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.dto.RegisterDto;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthController {

	@Autowired
	private UserContext userContext;
	@Autowired
	private SecurityUserDao securityUserDao;

	@GetMapping("/login")
	public String loginPage() {
		return "/user/index";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute RegisterDto registerDto, BindingResult result) {
		if (result.hasErrors()) {
			return "/user/index";
		}
		String account = registerDto.getAccount();
		if (null != securityUserDao.findByAccount(account)) {
			result.rejectValue("account", "errors.register.account", "The account is already in use");
			return "/user/index";
		}
		SecurityUser user = new SecurityUser();
		user.setAccount(registerDto.getAccount());
		user.setPassword(registerDto.getPassword());
		securityUserDao.save(user);
		userContext.setCurrentUser(user);
		return "/admin/artist/list";
//		if (null != account && null != rawPassword) {
//			if (null == securityUserService.loadUserByUsername(account)) {
//				SecurityUser user = new SecurityUser();
//				System.out.println(account);
//				System.out.println(rawPassword);
//				String password = passwordEncoder.encode(rawPassword);
//				user.setAccount(account);
//				user.setPassword(password);
//				user.setEnabled(true);
//				securityUserService.signUp(user);
//				SecurityRole role = new SecurityRole();
//				role.setAccount(account);
//				role.setCode("ROLE_USER");
//				Set<SecurityUser> users = new HashSet<SecurityUser>();
//				users.add(user);
//				role.setUsers(users);
//			}
//		}
//		return "/user/index";
	}
}
