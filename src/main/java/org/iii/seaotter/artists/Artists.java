package org.iii.seaotter.artists;

public class Artists {

	private Integer id;
	private String name;
	private java.sql.Date joinDate;
	private Integer manager;
	
	@Override
	public String toString() {
		return "Artists [id=" + id + ", name=" + name + ", joinDate=" + joinDate + ", manager=" + manager + "]";
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
	public java.sql.Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(java.sql.Date joinDate) {
		this.joinDate = joinDate;
	}
	public Integer getManager() {
		return manager;
	}
	public void setManager(Integer manager) {
		this.manager = manager;
	}
	
}
