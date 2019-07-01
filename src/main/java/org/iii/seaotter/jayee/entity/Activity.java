package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="begin_time")
	private java.util.Date beginTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="end_time")
	private java.util.Date endTime;
	
	@Column(name="awesome_Num")
	private Long awesomeNum;
	
	@Column(name="bad_Num")
	private Long badNum;
			
	@Column(name="cover_Image")
	private Long coverImage;	
		
}
