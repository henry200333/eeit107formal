package org.iii.seaotter.jayee.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

/**
 * @author Jason Peng 彭璿哲
 */
@Entity
@Table(name = "Artist")
@Data
public class Artist {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "photo")
	private String photo;
	@Column(name = "name")
	private String name;
	@Column(name = "fan_number")
	private Long fanNumber;
	@Column(name = "location")
	private String location;
	@OneToMany(mappedBy="artistId",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Activity> activitySet;
	

}
