package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SecurityUserDao extends JpaRepository<SecurityUser, Long>{

	public SecurityUser findByAccount(String account);
}
