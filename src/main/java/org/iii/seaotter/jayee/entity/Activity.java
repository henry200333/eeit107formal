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

import lombok.Data;

/**
 * @author Bennett 吳帆祥
 */

@Entity
@Table(name="Activity")
@Data
//@JsonIgnoreProperties("")
public class Activity {
	
	//活動編號
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="activity_id")
	private Long id;
	
	//活動名稱
	@Column(name="name")
	private String name;
	
	//表演者編號-外鍵
//	@ManyToOne
//	@JoinColumn(name = "artist_id")
	@Column(name="artist_id")
	private Long artistId;
	
	//表演者名稱
	@Column(name="artist")
	private String artist;
	
	//場地編號-外鍵
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location locationId;
	
	
	//活動描述
	@Column(name="description")
	private String description;
	
	//活動開始時間
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="begin_time")
	private java.util.Date beginTime;
	
	//活動結束時間
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="end_time")
	private java.util.Date endTime;
	
	//活動點讚數
	@Column(name="awesome_Num")
	private Long awesomeNum;
	
	//活動倒讚數
	@Column(name="bad_Num")
	private Long badNum;
			

}
