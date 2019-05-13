package com.ming;

import java.sql.Timestamp;

public class Show {
	
	private Integer id;
	private String showName;
	private String artist;
	private String type;
	private Timestamp date;
	
	public Show(String showName, String artist, String type, Timestamp date) {
		
		this.showName = showName;
		this.artist = artist;
		this.type = type;
		this.date = date;
	}
	public Show() {
		
	}
	@Override
	public String toString() {
		return "Show [id=" + id + ", showName=" + showName + ", artist=" + artist + ", type=" + type + ", date=" + date
				+ "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

	
}
