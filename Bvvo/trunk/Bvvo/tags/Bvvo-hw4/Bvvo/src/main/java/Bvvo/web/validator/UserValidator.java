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
    public void validate( Object target, Errors errors )
    {
        User user = (User) target;

        if( !StringUtils.hasText( user.getEmail() ) )
            errors.rejectValue( "username", "error.user.username.empty" );

        if( !StringUtils.hasText( user.getPassword() ) )
            errors.rejectValue( "password", "error.user.password.empty" );
    }

}
