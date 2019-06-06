package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	@Column(name="id")
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="address")
	private String address;
	@Column(name="max_people")
	private Integer maxPeople;
	@Column(name="phone")
	private String phone; 
	
	
	

}
