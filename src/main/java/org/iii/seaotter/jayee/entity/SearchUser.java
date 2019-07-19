package org.iii.seaotter.jayee.entity;

import java.util.List;
import java.util.Set;

import lombok.Data;

@Data
public class SearchUser{
	
	private Long userId;
	private String account;
	private String displayName;
	private String memberName;
	private String photo;
	private String gender;
	private String mail;
	private java.util.Date birth;
	private String address;
	private String tel;
	private String favLocation;
	private java.util.Date registerDate;
	private String introduction;
	private Long followers;
	
	private List<Performance> performanceSet;
	private List<Activity> activitySet;
	private List<SecurityUser> friends;
	private Set<SecurityRole> roles;
	private Set<SecurityRole> plikes;
}
