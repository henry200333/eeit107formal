package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.iii.seaotter.jayee.common.ForumBoard;

import lombok.Data;

/**
 * @author Henry劉長軒
 */

@Entity
@Table(name="Forum")
@Data
public class Forum {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="forumBoard")
	@Enumerated(EnumType.STRING)
	private ForumBoard forumBoard;
	
	@Column(name="ref_id")
	private Long refId;
	
	@Column(name="ref_comment_id")
	private Long refCommentId;
	
	@Column(name="user_name")
	private String userName;
	
	@Lob
	@Column(name="comment")
	private String comment;
	
	@Column(name="comment_date")
	private java.util.Date commentDate;
	
	@Column(name="like_count")
	private Integer likeCount;
	
	@Column(name="dislike_count")
	private Integer dislikeCount;

}
