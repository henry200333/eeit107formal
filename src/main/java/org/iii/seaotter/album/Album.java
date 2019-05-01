package org.iii.seaotter.album;

import java.util.Date;

public class Album {
	private Integer id;
	private String singer;
	private String name;
	private java.sql.Date published;
	private String company;
		
	@Override
	public String toString() {
		return "Album [id=" + id + ", singer=" + singer + ", name=" + name + ", published=" + published + ", company="
				+ company + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getPublished() {
		return published;
	}
	public void setPublished(java.sql.Date published) {
		this.published = published;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	
	

}
