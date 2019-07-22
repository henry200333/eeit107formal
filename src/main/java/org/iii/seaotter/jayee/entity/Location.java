package org.iii.seaotter.jayee.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Entity
@Table(name="Location")
@Data
public class Location {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="location_id")
	private Long locationId;
	//場地名稱
	@Column(name="location_name")
	private String locationName;
	//縣市
	@Column(name="city")
	private String city;
	//鄉鎮市區
	@Column(name="district")
	private String district;
	//(扣city和district)詳細地址
	@Column(name="address")
	private String address;
	
	@JsonIgnore
	@OneToMany(mappedBy="locationId",cascade=CascadeType.ALL,fetch=FetchType.LAZY)	
	private List<Activity> activityLocaltionSet;
//	經緯度
//	@Column(name="lat")
//	private Double lat;
//	@Column(name="lng")
//	private Double lng;
}
