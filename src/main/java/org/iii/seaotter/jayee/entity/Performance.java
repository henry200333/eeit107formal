package org.iii.seaotter.jayee.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
	@Column(name="p_id")
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
	@Column(name="dislikes")
	private Long dislikes;
	@Column(name="username")
	private String username;
	@Column(name="gerne")
	private String performanceGerne;
	@JoinColumn(name="userp_id")
	private Long userpId;
	
	//dislike
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_pdislike", joinColumns = { @JoinColumn(name = "p_id") }, inverseJoinColumns = {
			@JoinColumn(name = "user_id") })
	private List<SecurityUser> dislikeuser;
}