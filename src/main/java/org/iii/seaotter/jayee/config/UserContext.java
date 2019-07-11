package org.iii.seaotter.jayee.config;

import org.iii.seaotter.jayee.entity.SecurityUser;

public interface UserContext {
	SecurityUser getCurrentUser();

	void setCurrentUser(SecurityUser user);
}
