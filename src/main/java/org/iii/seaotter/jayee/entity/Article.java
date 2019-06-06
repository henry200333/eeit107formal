package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
	@NotNull(message="REF _ID欄位不可空白")
	@Column(name="ref_id")
	private Long refId;
	@Size(min=2, max=30,message="長度必須介於2~30字元之間")
	@Column(name="name")
	private String name;
	@Size(max=10000, message="內容最多只能輸入10000個字元")
	@Column(name="content")
	private String content;
	@NotNull(message="TYPE欄位不可空白")
	@Enumerated(EnumType.STRING)
	@Column(name="type")
	private Type type;
	
	public enum Type {
		Artist, Activity, Performance, Vender, Other
	}
	
}
