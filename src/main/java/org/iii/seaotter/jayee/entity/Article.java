package org.iii.seaotter.jayee.entity;

/**
 * 
 * @author Soma 陳品堯
 *
 */

public class Article {
	private Long id;
	private Long refId;
	private String name;
	private Integer type;
	private String context;
	
	
	@Override
	public String toString() {
		return "Article [id=" + id + ", refId=" + refId + ", name=" + name + ", type=" + type + ", context=" + context
				+ "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRefId() {
		return refId;
	}
	public void setRefId(Long refId) {
		this.refId = refId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
}
