package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * @author Henry劉長軒
 */

@Entity
@Table(name="Forum")
@Data
public class Forum {
	@Id
	@Column(name="id")
	private Long id;
	@Column(name="board")
	private Board board;
	@Column(name="name")
	private String name;
	@Column(name="context")
	private String context;
	@Column(name="comment_date")
	private java.util.Date commentDate;

	enum Board {
		Ariticle, Activity, Performance
	}

}
