package org.iii.seaotter.jayee.entity;

/**
 * 
 * @author Jason Peng 彭璿哲
 *
 */
public class Artist {
	
	private Long id;
	private String name;
	private Long fanNumber;
	private String location;
	
	@Override
	public String toString() {
		return "Artist [id=" + id + ", name=" + name + ", fanNumber=" + fanNumber + ", location=" + location + "]";
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
	public Long getFanNumber() {
		return fanNumber;
	}
	public void setFanNumber(Long fanNumber) {
		this.fanNumber = fanNumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
