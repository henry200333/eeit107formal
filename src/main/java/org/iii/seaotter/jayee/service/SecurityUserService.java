package org.iii.seaotter.jayee.service;

import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
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
		return securityUserDao.findByAccount(account);
	}

	public SecurityUser signUp(SecurityUser entity) {
		return securityUserDao.save(entity);
	}

}
