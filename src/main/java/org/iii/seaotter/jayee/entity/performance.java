package org.iii.seaotter.jayee.entity;

/**
 * 
 * @author Kallil(李承宇
 *
 */
public class performance {

	private Integer id;
	private String name;
	private String url;
	private String announcer;
	private Integer activity;


	@Override
		public String toString() {
			return super.toString();
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAnnouncer() {
		return announcer;
	}
	public void setAnnouncer(String announcer) {
		this.announcer = announcer;
	}
	public Integer getActivity() {
		return activity;
	}
	public void setActivity(Integer activty) {
		this.activity = activty;
	}
}