package org.iii.seaotter.jayee.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.iii.seaotter.jayee.common.ArticleType;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

/**
 * @author Soma 陳品堯
 */
@EntityListeners(AuditingEntityListener.class)
@Entity
@Table(name = "Article")
@Data
public class Article {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Size(min = 2, max = 60)
	@Column(name = "name")
	private String name;
	@Lob
	@Column(name = "content")
	private String content;
	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "article_type")
	private ArticleType articleType;
	@NotNull
	@Column(name = "ref_id")
	private Long refId;
	@Column(name = "count")
	private Long count;
	@CreatedDate
	@Column(name = "announce")
	private Date announce;
}
