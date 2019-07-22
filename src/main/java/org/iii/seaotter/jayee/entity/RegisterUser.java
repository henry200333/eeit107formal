package org.iii.seaotter.jayee.entity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.iii.seaotter.jayee.validator.PasswordMatches;
import org.iii.seaotter.jayee.validator.ValidEmail;

import lombok.Data;

@PasswordMatches
@Data
public class RegisterUser{
	
	@NotNull
	@NotEmpty
	private String account;
	@NotNull
	@NotEmpty
	private String password;
	private String matchingPassword;
	@ValidEmail
	@NotNull
	@NotEmpty
	private String mail;

}
