package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.SecurityRole;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SecurityRoleDao extends JpaRepository<SecurityRole, Long> {

	public SecurityRole findByCode(String code);

}
