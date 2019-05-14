package org.iii.seaotter.performance;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class Performance {

	private Integer id;
	private String showName;
	private String artist; //要是 artist 的 id
	private String type;
	private Timestamp date;
	private Integer counts;

	public Performance(String showName, String artist, String type, Timestamp date) {

		this.showName = showName;
		this.artist = artist;
		this.type = type;
		this.date = date;
	}

	public Performance() {

	}

	@Override
	public String toString() {
		return "performance [id=" + id + ", showName=" + showName + ", artist=" + artist + ", type=" + type + ", date="
				+ date + "]";
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

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}

}
