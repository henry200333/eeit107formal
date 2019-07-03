package org.iii.seaotter.jayee.common;

import java.util.List;

import lombok.Data;

@Data
public class GridResponse <T>{
	
	private Integer page;
	private Long records;  //total page numbers
	private Integer total;  //total element numbers
	private List<T> rows;

}
