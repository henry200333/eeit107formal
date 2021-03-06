package org.iii.seaotter.jayee.entity;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Entity
@Table(name = "SecurityUser")
@Data
public class SecurityUser implements UserDetails {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long userId;
	@Column(name = "account")
	private String account;
	@Column(name = "password")
	private String password;
	@Column(name = "display_name")
	private String displayName;
	@Column(name = "member_name")
	private String memberName;
	@Column(name = "photo")
	private String photo;
	@Column(name = "gender")
	private String gender;
	@Column(name = "mail")
	private String mail;
	@Column(name = "birth")
	private java.util.Date birth;
	@Column(name = "address")
	private String address;
	@Column(name = "tel")
	private String tel;
	@Column(name = "favorite_location")
	private String favLocation;
	@CreatedDate
	@Column(name = "register_date")
	private java.util.Date registerDate;
	@Column(name = "introduction")
	private String introduction;
	@Column(name = "followers")
	private Long followers;
	@Column(name = "enabled")
	private Boolean enabled;

	public SecurityUser() {
		super();
		this.enabled = false;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_role", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "role_id") })
	private Set<SecurityRole> roles;
	@JsonIgnoreProperties("friends")
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "friend", joinColumns = { @JoinColumn(name = "self_id") }, inverseJoinColumns = {
			@JoinColumn(name = "friend_id") })
	@JsonBackReference
	private List<SecurityUser> friends;

	// User的ID關聯到Activity的artistId外鍵欄位
	@JsonIgnore
	@OneToMany(mappedBy = "useraId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Activity> activitySet;

	// User的ID關聯到Activity的artistId外鍵欄位
	@JsonIgnore
	@OneToMany(mappedBy = "userpId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Performance> performanceSet;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_plike", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "p_id") })
	private List<Performance> plikes;

	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_forumlike", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "forum_id") })
	private List<Forum> forumLikes;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_forumdislike", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
			@JoinColumn(name = "forum_id") })
	private List<Forum> forumDislikes;
	
//	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@JsonBackReference
//	@JoinTable(name = "user_followAct", joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = {
//			@JoinColumn(name = "activity_id") })
//	private List<Activity> followAct;
	
	
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Vender vender;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return account;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

}
