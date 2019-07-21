package org.iii.seaotter.jayee.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.iii.seaotter.jayee.entity.RegisterUser;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object>{
	
	@Override
	public void initialize(PasswordMatches constraintAnnotation) {
	}
	
	@Override
	public boolean isValid(Object obj, ConstraintValidatorContext context) {
		RegisterUser user = (RegisterUser) obj;
		return user.getPassword().equals(user.getMatchingPassword());
	}

}
