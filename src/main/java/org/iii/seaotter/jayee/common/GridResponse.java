package org.iii.seaotter.jayee.common;

import java.util.List;

import lombok.Data;

@Data
public class GridResponse <T>{
	
	private Integer page;
	private Long records;
	private Integer total;
	private List<T> rows;

}
