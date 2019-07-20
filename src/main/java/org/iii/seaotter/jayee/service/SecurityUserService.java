package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	public SecurityUser getByUserName(String userName) {
		return securityUserDao.findByAccount(userName);
	}
	
	public List<SecurityUser> getTop5(){
		return securityUserDao.findTop5ByOrderByFollowersDesc();
	}
	
	public static boolean hasRole (String roleName)
	{
	    return SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
	            .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals(roleName));
	}

	public void addfirend(SecurityUser self, SecurityUser friend) {
		
		List<SecurityUser> selffriends=self.getFriends();
		 selffriends.add(friend);
		 self.setFriends(selffriends);
		 List<SecurityUser> friendfriends=friend.getFriends();
		 friendfriends.add(self);
		 self.setFriends(friendfriends);
		 return;
	}
	
	public List<Performance> findPlikesByUserId(Long id){
		return securityUserDao.findPlikesByUserId(id);
	};
	
}
