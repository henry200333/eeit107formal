package org.iii.seaotter.jayee.dto;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class RegisterDto {
	
	@NotEmpty(message="Account is required")
	private String account;
	@NotEmpty(message="Password is required")
	private String password;
}
