package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SecurityRoleDao extends JpaRepository<SecurityRole, Long> {

	public SecurityUser findByCode(String code);

}
