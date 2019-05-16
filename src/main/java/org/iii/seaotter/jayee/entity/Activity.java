package org.iii.seaotter.jayee.entity;

import lombok.Data;

/**
 * 
 * @author Bennett 吳帆祥
 *
 */

@Data
public class Activity {
	/**
	 * Activity id
	 */
	private Long id;
	/**
	 * Activity name
	 */
	private String name;
	/**
	 * Activity time
	 */
	private java.util.Date time;
	/**
	 * Activity article
	 */
	private String article;
	
	
}
