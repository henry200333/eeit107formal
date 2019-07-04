package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
//	經緯度
//	@Column(name="lat")
//	private Double lat;
//	@Column(name="lng")
//	private Double lng;
}
