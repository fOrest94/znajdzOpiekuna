package info.znOpk.web;

import info.znOpk.DTO.NannyDTO;
import info.znOpk.model.User;
import info.znOpk.service.UserService;
import info.znOpk.validator.RegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {
	
    @Autowired
    private RegisterValidator registerValidator;

    @Autowired
	private UserService userService;

	@RequestMapping(value = "/registrationParent", method = RequestMethod.GET)
	public String registerParent(Model model) {

		model.addAttribute("userForm", new User());
		return "registrationParent";
	}

	@RequestMapping(value = "/registrationParent", method = RequestMethod.POST)
	public String registerParent(@ModelAttribute("userForm") User user, BindingResult bindingResult, Model model) {

		registerValidator.validate(user, bindingResult);

		if (bindingResult.hasErrors()) {
	    	return "registrationParent";
		}
		user.setUserType("simple");
		user.setSex(true);
		userService.save(user);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/registrationGuardian", method = RequestMethod.GET)
	public String registerGuardian(ModelMap model) {

		model.addAttribute("guardianForm", new NannyDTO());
		return "registrationGuardian";
	}
	
	@RequestMapping(value = "/registrationGuardian", method = RequestMethod.POST)
	public String registerGuardian(@ModelAttribute("registrationGuardian") NannyDTO nannyDTO, BindingResult bindingResult, ModelMap model) {
		
		System.out.println(nannyDTO.toString());
		//registerValidator.validate(nannyDTO, bindingResult);

		if (bindingResult.hasErrors()) {
	    	return "registrationGuardian";
		}         

		//userService.save(nannyForm);
		return "index";
	}
}
