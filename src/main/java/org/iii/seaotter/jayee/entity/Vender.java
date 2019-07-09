package org.iii.seaotter.jayee.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

/**
 *
 *@author ming 李宜鳴  
 * 
 */
@Entity
@Table(name="Vender")
@Data
public class Vender {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="vender_id")
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="address")
	private String address;
	@Column(name="max_people")
	private Integer maxPeople;
	@Column(name="phone")
	private String phone; 
	@Column(name="lat")
	private Double lat;
	@Column(name="lng")
	private Double lng;
	

	
	
	

}
