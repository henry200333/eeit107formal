package com.henryleo;

import java.sql.Timestamp; 

public class Performance {
	
	private Integer p_id;
	private Integer a_id;
	private String p_name;
	private String p_url;
	private Timestamp update_time;
	private Integer counts;
		
	@Override
	public String toString() {
		return "Performance [p_id=" + p_id + ", a_id=" + a_id + ", p_name=" + p_name + ", p_url=" + p_url
				+ ", update_time=" + update_time + ", counts=" + counts + "]";
	}
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public Integer getA_id() {
		return a_id;
	}
	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	
	
	
}
