package org.iii.seaotter.jayee.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.iii.seaotter.jayee.common.ForumBoard;

import com.fasterxml.jackson.annotation.JsonBackReference;

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
	@Column(name="forum_id")
	private Long id;
	
	@Column(name="forum_board")
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
	
	@Column(name="user_photo")
	private String userPhoto;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_forumdislike", joinColumns = { @JoinColumn(name = "forum_id") }, inverseJoinColumns = {
			@JoinColumn(name = "user_id") })
	private List<SecurityUser> dislikeuser;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JsonBackReference
	@JoinTable(name = "user_forumlike", joinColumns = { @JoinColumn(name = "forum_id") }, inverseJoinColumns = {
			@JoinColumn(name = "user_id") })
	private List<SecurityUser> likeuser;

}
