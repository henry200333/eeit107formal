package org.iii.seaotter.jayee.config;

import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

@Component
public class SpringSecurityUserContext implements UserContext {

	@Autowired
	private SecurityUserDao securityUserDao;

	@Autowired
	private SecurityUserService securityUserService;

	@Override
	public SecurityUser getCurrentUser() {
		// TODO Auto-generated method stub
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication auth = context.getAuthentication();

		if (null == auth)
			return null;

		String account = auth.getName();
		return securityUserDao.findByAccount(account);
	}

	@Override
	public void setCurrentUser(SecurityUser user) {
		// TODO Auto-generated method stub
		UserDetails userDetails = securityUserService.loadUserByUsername(user.getAccount());

		Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(),
				userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);

	}

}
