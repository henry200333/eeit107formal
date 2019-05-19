package org.iii.seaotter.jayee.entity;

import lombok.Data;

/**
 * 
 * @author Henry劉長軒
 *
 */

@Data
public class Forum {
	private Long id;
	private Board board;
	private String name;
	private String context;
	private java.util.Date commentDate;

	enum Board {
		Ariticle, Activity, Performance
	}

}
