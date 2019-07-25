package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Entity
@Table(name = "Notice")
@Data
public class Notice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "readed")
	private Boolean readed;
	
	
	/*申請中   已拒絕  已接受*/
	@Column(name = "friend_status")
	private String friendstatus;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@Column(name="send_time")
	private java.util.Date sendtime;
	
	@Column(name = "sender")
	private Long sender;
	
	@Column(name = "Receiver")
	private Long receiver;
	
}
