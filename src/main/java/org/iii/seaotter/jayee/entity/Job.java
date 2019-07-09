package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
	
	@Column(name="job_time")
	private java.util.Date jobTime;
	
	@Column(name="detal")
	private String detal;
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JsonBackReference
//	@JoinTable(name="Vender")
	@JoinColumn(name="vender_id", nullable=false)
	private Vender vender;

	
	
}
