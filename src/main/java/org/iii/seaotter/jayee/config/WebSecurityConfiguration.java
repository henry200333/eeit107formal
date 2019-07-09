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

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select account, password, enabled" + " from security_user where account=?")
				.authoritiesByUsernameQuery("select account, code" + " from security_role where account=?");

//		auth.inMemoryAuthentication()
//		.withUser("admin")
//		.password("$2a$10$CI.TCDqxdr8xAhnkCz9oyOViGnBG5iHFFxicjcRwJORbt1IzENR7G")
//		.roles("ADMIN");

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
		.anyRequest().hasAnyRole("ADMIN", "USER")
		.and()
		.formLogin()
		.loginPage("/login")
		.failureUrl("/login")
		.defaultSuccessUrl("/admin/artist/list")
		.permitAll()
		.and().logout().permitAll()
		.logoutSuccessUrl("/login")
		.and()
		.csrf().disable();
	}
}