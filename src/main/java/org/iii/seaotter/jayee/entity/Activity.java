package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * @author Bennett 吳帆祥
 */

@Entity
@Table(name="Activity")
@Data
public class Activity {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="activity_id")
	private Long id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="artist")
	private String artist;
	
	@Column(name="description")
	private String description;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Column(name="begin_time")
	private java.util.Date beginTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="end_time")
	private java.util.Date endTime;
	
		
}
