package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Entity
@Table(name = "Notice")
@Data
public class Notice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long Id;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "content")
	private String content;
	
	@Column(name = "readed")
	private Boolean readed;
	
	
	/*申請中   已拒絕  已接受*/
	@Column(name = "friend_status")
	private String friendStatus;
	
	@Column(name = "sender")
	private Long sender;
	
	@Column(name = "Receiver")
	private Long receiver;
	
}
