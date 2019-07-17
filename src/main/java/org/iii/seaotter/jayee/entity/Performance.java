package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	@Column(name="title")
	private String title;
	@Column(name="introduction")
	private String introduction;
	@Column(name="youtube_url")
	private String url;
	@Column(name="update_time")
	private java.util.Date updateTime;
	@Column(name="activity_id")
	private Long activityId;
	@Column(name="views")
	private Long views;
	@Column(name="likes")
	private Long likes;
	@Column(name="unlikes")
	private Long unlikes;
	@Column(name="username")
	private String username;
	@Column(name="gerne")
	private String performanceGerne;
	@JoinColumn(name="partist_id")
	private Long partistId;
}