package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * @author Soma 陳品堯
 */
@Entity
@Table(name="Article")
@Data
public class Article {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	@NotNull
	@Column(name="ref_id")
	private Long refId;
	@Size(min=2, max=30)
	@Column(name="name")
	private String name;
	@NotNull
	@Column(name="type")
	private Integer type;
	@Size(max=10000)
	@Column(name="content")
	private String content;
	
	
	
}
