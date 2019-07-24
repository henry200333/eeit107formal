package org.iii.seaotter.jayee.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Entity
@Table(name = "job")
@Data
public class Job {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="job_id")
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="job_type")
	private String jobType;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name="job_time")
	private java.util.Date jobTime;
	
	@Column(name="detal")
	private String detal;
	
	@Column(name="reward")
	private Integer reward;
	
	@Column(name="city")
	private String city;
	
	@Column(name="district")
	private String district;
	
	@Column(name="address")
	private String address;
	
	@Column(name="vender_name")
	private String venderName;
	
	@Column(name="status")
	private String status;
	
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="vender_id", nullable=false)
	private Vender vender;
	
	
	
	


	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
//	@JsonBackReference
	@JoinColumn(name="user_id")
	private SecurityUser user;
}
