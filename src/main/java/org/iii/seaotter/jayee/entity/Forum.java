package org.iii.seaotter.jayee.entity;

/**
 * 
 * @author Henry劉長軒
 *
 */

public class Forum {
	private Long id;
	private String name;
	private String context;
	private java.util.Date commentDate;
	
	@Override
	public String toString() {
		return "Forum [id=" + id + ", name=" + name + ", context=" + context + ", date=" + commentDate + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public java.util.Date getDate() {
		return commentDate;
	}
	public void setDate(java.util.Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	

}
