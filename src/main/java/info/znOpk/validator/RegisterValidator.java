package info.znOpk.validator;

import info.znOpk.model.User;
import info.znOpk.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;


@Component
public class RegisterValidator{
	
    @Autowired
    private SessionService sessionService;

    public void validate(User user, Errors errors) {

        ValidationUtils.rejectIfEmpty(errors, "username", "NotEmpty");
        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
        	System.out.println("aaaaa");
            errors.rejectValue("username", "Size.userForm.username");
        }
        if (sessionService.getUser(user.getUsername()) != null) {
        	System.out.println("asdsasads34234343");
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmpty(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
        	System.out.println("bbbbbb");
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
        	System.out.println("cccccc");
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
    
}