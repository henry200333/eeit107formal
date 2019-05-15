package org.iii.seaotter.artist;

import java.sql.Timestamp; 

public class Performance {
	
	private Integer pId;
	private Integer aId;
	private String pName;
	private String pUrl;
	private Timestamp updateTime;
	private Integer counts;
		
	@Override
	public String toString() {
		return "Performance [pId=" + pId + ", aId=" + aId + ", pName=" + pName + ", pUrl=" + pUrl + ", updateTime="
				+ updateTime + ", counts=" + counts + "]";
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
		
	
	
	
}
