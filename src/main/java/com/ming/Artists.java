package com.ming;

import java.sql.Timestamp;


public class Artists {

	private Integer id;
	private String name;
	private Timestamp joinDate;
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
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public Integer getManager() {
		return manager;
	}
	public void setManager(Integer manager) {
		this.manager = manager;
	}
	public Artists(String name, Timestamp joinDate, Integer manager) {
		this.name = name;
		this.joinDate = joinDate;
		this.manager = manager;
		
	}
	public Artists() {
		
	}
	
}
