package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.ConfirmationToken;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ConfirmationTokenRepository extends JpaRepository<ConfirmationToken, Long>,JpaSpecificationExecutor<SecurityUser>{
	
	public ConfirmationToken findByConfirmationToken(String confirmationToken);
	
}
