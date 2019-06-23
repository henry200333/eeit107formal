package org.iii.seaotter.jayee.common;

import lombok.Data;

@Data
public class Message {
	private String title;
	private String content;
	
	public Message() {};
	public Message(String title, String content) {
		this.title = title;
		this.content = content;
	}
}
