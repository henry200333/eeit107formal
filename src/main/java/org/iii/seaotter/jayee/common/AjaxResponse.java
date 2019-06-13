package org.iii.seaotter.jayee.common;

import lombok.Data;

@Data
public class AjaxResponse <T>{

	
	private AjaxResponseType type;
	private T data;
	
	
}
