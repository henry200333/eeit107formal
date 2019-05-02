package com.ming;

import java.util.Date;

public class DrinkBean {
	private Long id;
	private String name;
	private Date effdate;
	private Integer capacity;
	private String venname;

	public String toString() {
		return "DrinkBean [id=" + id + ", name=" + name + ", effdate=" + effdate + ", capacity=" + capacity
				+ ", venname=" + venname + "]";
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

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Date getEffdate() {
		return effdate;
	}

	public void setEffdate(Date effdate) {
		this.effdate = effdate;
	}

	public String getVenname() {
		return venname;
	}

	public void setVenname(String venname) {
		this.venname = venname;
	}

}
