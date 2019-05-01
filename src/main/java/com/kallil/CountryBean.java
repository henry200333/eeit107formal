package com.kallil;

public class CountryBean {
	


	private Integer countryId; //編號
	private Integer countryCode; //代碼
	private String countryName; //名稱
	private java.util.Date timeBeIndependent; //獨立日期
	private String state; //隸屬州
	
	public String toString() {
		return "CountryBean [countryId=" + countryId + ", countryCode=" + countryCode + ", countryName=" + countryName+ ", timeBeIndependent=" + timeBeIndependent + ", state=" + state + "]";
	}
	
	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public java.util.Date getTimeBeIndependent() {
		return timeBeIndependent;
	}

	public void setTimeBeIndependent(java.util.Date timeBeIndependent) {
		this.timeBeIndependent = timeBeIndependent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
}
