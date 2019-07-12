package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SecurityUserDao extends JpaRepository<SecurityUser, Long>,JpaSpecificationExecutor<SecurityUser> {

	public SecurityUser findByAccount(String account);

}
