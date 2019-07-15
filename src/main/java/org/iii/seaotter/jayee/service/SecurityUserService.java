package org.iii.seaotter.jayee.service;

import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SecurityUserService implements UserDetailsService {

	@Autowired
	private SecurityUserDao securityUserDao;

	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		if (securityUserDao.findByAccount(account) != null)
			return securityUserDao.findByAccount(account);
		else
			return securityUserDao.findByMail(account);
	}
	
	public  SecurityUser findUserBean(String account) throws UsernameNotFoundException {
		//getFriends
		return securityUserDao.findByAccount(account);
	}
	
	@Transactional(readOnly=true)
	public Page<SecurityUser> getAll(Specification<SecurityUser> specification, Pageable  pageable){
		return securityUserDao.findAll(specification, pageable);
	}
	
	@Transactional(readOnly=true)
	public SecurityUser getById(Long id) {
		return securityUserDao.findById(id).orElse(null);
	}
	
	public SecurityUser signUp(SecurityUser entity) {
		return securityUserDao.save(entity);
	}
	
	public SecurityUser update(SecurityUser entity) {
		SecurityUser securityUser = null;
		if (securityUserDao.findById(entity.getUserId()) != null) {
			securityUser = securityUserDao.save(entity);
		}
		return securityUser;
	}
	
}
