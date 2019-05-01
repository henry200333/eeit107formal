package com.soma;

public class Anime {
	
	private Integer id;
	private String name;
	private java.util.Date releaseDate;
	private String genre;
	private int episode;
	
	@Override
	public String toString() {
		return "Anime [id=" + id + ", name=" + name + ", releaseDate=" + releaseDate + ", genre=" + genre + ", episode="
				+ episode + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.util.Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(java.util.Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getEpisode() {
		return episode;
	}
	public void setEpisode(int episode) {
		this.episode = episode;
	}
}
