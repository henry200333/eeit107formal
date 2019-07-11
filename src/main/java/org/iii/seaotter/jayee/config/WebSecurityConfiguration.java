package org.iii.seaotter.jayee.config;

import javax.sql.DataSource;

import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;

//	@Autowired
//	private SecurityUserService securityUserService;

	@Bean
	public UserDetailsService userDetailsService() {
		return new SecurityUserService();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

//		auth.userDetailsService(securityUserService);

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("SELECT account, password, enabled FROM security_user WHERE account=?")
				.authoritiesByUsernameQuery("SELECT s.account, r.code FROM security_user s JOIN user_role ur ON s.user_id = ur.user_id JOIN security_role r ON ur.role_id = r.role_id WHERE account=?");

//		auth.inMemoryAuthentication()
//		.withUser("admin")
//		.password("$2a$10$CI.TCDqxdr8xAhnkCz9oyOViGnBG5iHFFxicjcRwJORbt1IzENR7G")
//		.roles("ADMIN");

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
		.antMatchers("/user/**").hasRole("USER")
		.antMatchers("/admin/**").hasRole("ADMIN")
		.and()
		.formLogin().permitAll()
		.loginPage("/login")
		.failureUrl("/login")
		.defaultSuccessUrl("/admin/artist/list")
		.and()
		.logout().permitAll()
		.logoutSuccessUrl("/login")
		.and()
		.csrf().disable();

	}
}