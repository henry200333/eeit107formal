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
 * @author Kallil(李承宇
 *
 */
@Entity
@Table(name="performance")
@Data
public class Performance {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="youtube_url")
	private String url;
	@Column(name="update_time")
	private java.util.Date updateTime;
	@Column(name="activity_id")
	private Long activityId;

}