package org.iii.seaotter.jayee.config;

import java.util.Collection;
import java.util.List;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

public class UserAuthorityUtils {
	private static final List<GrantedAuthority> ADMIN_ROLES = AuthorityUtils.createAuthorityList("ROLE_ADMIN",
			"ROLE_USER");

	private static final List<GrantedAuthority> USER_ROLES = AuthorityUtils.createAuthorityList("ROLE_USER");

	public static Collection<? extends GrantedAuthority> createAuthorities(SecurityUser user) {
		String username = user.getUsername();
		if ("admin".equals(username) || "123".equals(username)) {
			return ADMIN_ROLES;
		}
		return USER_ROLES;
	}
}
