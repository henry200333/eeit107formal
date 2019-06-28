package org.iii.seaotter.jayee.common;

import lombok.Data;

@Data
public class GridResponse <T>{
	
	private Integer total;
	private Integer page;
	private Integer records;
	private T rows;

}
