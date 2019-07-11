package org.iii.seaotter.jayee.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity
@Table(name = "SecurityRole")
@Data
public class SecurityRole implements GrantedAuthority {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_id")
	private Long roleId;

//	@Column(name = "account")
//	private String account;

	@JsonBackReference
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roles")
	private Set<SecurityUser> users = new HashSet<SecurityUser>();

	@Column(name = "code")
	private String code;

	public String getAuthority() {
		return this.code;
	}

}
