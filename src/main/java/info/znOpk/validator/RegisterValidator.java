package info.znOpk.validator;

import info.znOpk.model.User;
import info.znOpk.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class RegisterValidator implements Validator {

    @Autowired
    private SessionService sessionService;

    public void validate(Object o, Errors errors) {

        User user = (User)o;

        ValidationUtils.rejectIfEmpty(errors, "username", "NotEmpty");
        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        if (sessionService.getUser(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmpty(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (isTheSame(user.getPasswordConfirm(), user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }

    public boolean isTheSame(String pass, String passConf){

        if(!pass.equals(passConf)){
            return false;
        }
        return true;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }
}