package info.znOpk.web;

import info.znOpk.model.User;
import info.znOpk.service.UserService;
import info.znOpk.authentication.EmailAuthentication;
import info.znOpk.validator.RegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;

@Controller
public class RegisterController {
	
    @Autowired
    private RegisterValidator registerValidator;

    @Autowired
	private UserService userService;

	@Autowired
	private EmailAuthentication emailAuthentication;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registerParent(Model model) {

		model.addAttribute("userForm", new User());
		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String register(@ModelAttribute("userForm") User user, BindingResult bindingResult, Model model) throws MessagingException {

		registerValidator.validate(user, bindingResult);

		if (bindingResult.hasErrors()) {
	    	return "registration";
		}

		emailAuthentication.generateAndSendEmail(user);
		userService.save(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/registrationm", method = RequestMethod.POST)
	public String registerAuthentication(@ModelAttribute("userForm") User user, BindingResult bindingResult, Model model) throws MessagingException {


		return "redirect:/";
	}
}
