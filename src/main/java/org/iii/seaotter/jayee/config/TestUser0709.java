package org.iii.seaotter.jayee.config;

import java.util.HashSet;
import java.util.Set;

import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


public class TestUser0709 {
	
	@Autowired
	SecurityUserService securityUserService;
	
	
	public TestUser0709() {
		SecurityUser temp = new SecurityUser();
		temp.setAccount("apple");
		temp.setPassword("55688");
		temp.setEnabled(true);
		
		Set<SecurityRole> tempSet = new HashSet<SecurityRole>();
		
		SecurityRole temp2 = new SecurityRole();
		temp2.setCode("ROLE_USER");
		SecurityRole temp3 = new SecurityRole();
		temp2.setCode("ROLE_ADMIN");
		tempSet.add(temp2);
		tempSet.add(temp3);
		temp.setRoles(tempSet);
		System.out.println(123123132);
		
		securityUserService.signUp(temp);	
	}	
}
