package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Data;

/**
 * @author Soma 陳品堯
 */
@Entity
@Table(name = "Article")
@Data
public class Article {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Size(min = 2, max = 30)
	@Column(name = "name")
	private String name;
	@Lob
	@Column(name = "content")
	private String content;
	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "type")
	private Type type;
	@NotNull
	@Column(name = "ref_id")
	private Long refId;

	public enum Type {
		Artist, Activity, Performance, Vender, Other
	}


}
