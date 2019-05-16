package org.iii.seaotter.jayee.entity;
/**
 * 
 * @author Bennett 吳帆祥
 *
 */
public class Activity {
	private Long id;
	private String name;
	private java.util.Date time;
	private String article;
	
	@Override
	public String toString() {
		return "Activity [id=" + id + ", name=" + name + ", time=" + time + ", article=" + article + "]";
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
	public java.util.Date getTime() {
		return time;
	}
	public void setTime(java.util.Date time) {
		this.time = time;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	
}
