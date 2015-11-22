package Bvvo.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import Bvvo.model.User;

@Component
public class UserValidator implements Validator {

	@Override
	public boolean supports( Class<?> clazz )
	{
		return User.class.isAssignableFrom( clazz );
	}

	@Override
	public void validate( Object usertarget, Errors errors )
	{
		User user = (User) usertarget;

		if( !StringUtils.hasText( user.getEmail()) )
			errors.rejectValue( "email", "error.user.email.empty" );

		if( !StringUtils.hasText( user.getPassword() ) )
			errors.rejectValue( "password", "error.user.password.empty" );

		if( !StringUtils.hasText( user.getfName() ) )
			errors.rejectValue( "fName", "error.user.fName.empty" );

		if( !StringUtils.hasText( user.getlName()) )
			errors.rejectValue( "lName", "error.user.lName.empty" );

		if( !StringUtils.hasText( user.getStAddress()) )
			errors.rejectValue( "stAddress", "error.user.stAddress.empty" );

		if( !StringUtils.hasText( user.getCity()) )
			errors.rejectValue( "city", "error.user.city.empty" );

		if( !StringUtils.hasText( user.getState()) )
			errors.rejectValue( "state", "error.user.state.empty" );

		if( !StringUtils.hasText( String.valueOf(user.getZip())) )
			errors.rejectValue( "zip", "error.user.zip.empty" );
		
	}
}
