package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.PasswordResetToken;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long>,JpaSpecificationExecutor<SecurityUser>{
	
	public PasswordResetToken findByPasswordToken(String passwordResetToken);
	
}
