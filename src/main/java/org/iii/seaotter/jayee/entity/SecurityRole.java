package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

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

//	@JsonBackReference
//	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roles")
//	private Set<SecurityUser> users = new HashSet<SecurityUser>();

	@Column(name = "code")
	private String code;

	public String getAuthority() {
		return this.code;
	}

}
