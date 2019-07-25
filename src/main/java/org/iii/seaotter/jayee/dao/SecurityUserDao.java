package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SecurityUserDao extends JpaRepository<SecurityUser, Long>,JpaSpecificationExecutor<SecurityUser> {

	public SecurityUser findByAccount(String account);
	
	public SecurityUser findByMail(String mail);
	
	public SecurityUser findByMailIgnoreCase(String mail);
	
	public List<SecurityUser> findTop5ByOrderByFollowersDesc();
	
	public List<Performance> findPlikesByUserId(Long id);
	
	public List<SecurityUser> findByDisplayNameContaining(String displayName);

	public SecurityUser findByDisplayName(String displayName);
}
