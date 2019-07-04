package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * @author ming 李宜鳴  
 * @author Bennett 吳帆祥
 */



@Entity
@Table(name="Location")
@Data
public class Location {
	@Id
	@Column(name="locationId")
	private Long locationId;
	@Column(name="locationName")
	private String locationName;
	@Column(name="locationAddress")
	private String locationAddress;
	@Column(name="lat")
	private Double lat;
	@Column(name="lng")
	private Double lng;
}
