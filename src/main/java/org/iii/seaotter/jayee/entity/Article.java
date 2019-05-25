package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * @author Soma 陳品堯
 */
@Entity
@Table(name="Article")
@Data
public class Article {
	@Id
	@Column(name="id")
	private Long id;
	@Column(name="ref_id")
	private Long refId;
	@Column(name="name")
	private String name;
	@Column(name="type")
	private Integer type;
	@Column(name="context")
	private String context;
	
	
	
}
