package org.iii.seaotter.jayee.service;

import java.util.Collection;

import org.iii.seaotter.jayee.config.UserAuthorityUtils;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SecurityUserService implements UserDetailsService {

	@Autowired
	private SecurityUserDao securityUserDao;

	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		SecurityUser user = securityUserDao.findByAccount(account);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username/password");
		}
		Collection<? extends GrantedAuthority> authorities = UserAuthorityUtils.createAuthorities(user);
		return new User(user.getUsername(), user.getPassword(), authorities);
	}

	public SecurityUser signUp(SecurityUser entity) {
		return securityUserDao.save(entity);
	}

}
