package org.iii.seaotter.jayee.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.messaging.handler.annotation.Payload;

@Documented
@Constraint(validatedBy = EmailValidator.class)
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE,ElementType.FIELD,ElementType.ANNOTATION_TYPE})
public @interface ValidEmail {
	String message() default "Invalid email";
    Class<?>[] groups() default {}; 
    Class<? extends Payload>[] payload() default {};
}
