package com.ming;

import java.util.Date;

public class DrinkBean {
	private Long id; 
	private String prodname;
	private Date effdate;
	private Integer capacity;
	private String venname;

	public String toString() {
		return "DrinkBean [id=" + id + ", prodname=" + prodname + ", effdate=" + effdate + ", capacity=" + capacity
				+ ", venname=" + venname + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
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
