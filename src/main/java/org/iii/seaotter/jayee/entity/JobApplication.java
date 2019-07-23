package org.iii.seaotter.jayee.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity
@Table(name ="job_application")
@Data
public class JobApplication {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="job_application_id")
	private Long id;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id", nullable=false)
	private SecurityUser user;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="job_id", nullable=false)
	private Job job;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="application_time")
	private java.util.Date applicationTime;
	
	@Column(name="status")
	private String status;
}
