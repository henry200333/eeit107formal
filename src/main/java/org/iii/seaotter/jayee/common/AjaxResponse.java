package org.iii.seaotter.jayee.common;

import java.util.List;

import lombok.Data;

@Data
public class AjaxResponse <T>{
	private AjaxResponseType type;
	private T data;
	private List<Message> messages;
	
}
