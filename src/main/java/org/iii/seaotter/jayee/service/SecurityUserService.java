package org.iii.seaotter.jayee.service;

<<<<<<< HEAD
=======
import org.hibernate.Hibernate;
>>>>>>> branch 'master' of https://github.com/henry200333/eeit107formal.git
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SecurityUserService implements UserDetailsService {

	@Autowired
	private SecurityUserDao securityUserDao;
	
	@Transactional
	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
<<<<<<< HEAD
		return securityUserDao.findByAccount(account);
=======
		SecurityUser user = securityUserDao.findByAccount(account);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username/password");
		}
//		Collection<? extends GrantedAuthority> authorities = UserAuthorityUtils.createAuthorities(user);
		Hibernate.initialize(user.getRoles());
		return user;
>>>>>>> branch 'master' of https://github.com/henry200333/eeit107formal.git
	}

	public SecurityUser signUp(SecurityUser entity) {
		return securityUserDao.save(entity);
	}

}
