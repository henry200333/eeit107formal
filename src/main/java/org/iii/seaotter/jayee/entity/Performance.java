package org.iii.seaotter.jayee.entity;

/**
 * 
 * @author Kallil(李承宇
 *
 */
public class Performance {

	private Long id;
	private String name;
	private String url;
	private java.util.Date updateTime;
	private Long activityId;


	@Override
		public String toString() {
			return super.toString();
		}
	public long getId() {
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public java.util.Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdatetime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getActivity() {
		return activity;
	}
	public void setActivity(Integer activty) {
		this.activity = activty;
	}


}