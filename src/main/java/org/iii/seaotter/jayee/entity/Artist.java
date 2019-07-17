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
	@Column(name = "artist_id")
	private Long artistId;
	@Column(name = "artist_name")
	private String artistName;
	@Column(name = "week_followers")
	private Long wFollowers;
	@Column(name = "total_followers")
	private Long tFollowers;
	//Artist的ID關聯到Activity的artistId外鍵欄位
	@OneToMany(mappedBy="artistId",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Activity> activitySet;
	//Artist的ID關聯到Performance的artistId外鍵欄位
	@OneToMany(mappedBy="partistId",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Performance> performanceSet;
	

}
