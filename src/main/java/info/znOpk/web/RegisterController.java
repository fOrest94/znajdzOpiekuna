package info.znOpk.web;

import info.znOpk.authentication.EmailEncryption;
import info.znOpk.model.Nanny;
import info.znOpk.model.User;
import info.znOpk.service.SecurityService;
import info.znOpk.service.UserService;
import info.znOpk.authentication.EmailAuthentication;
import info.znOpk.validator.RegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

@Controller
public class RegisterController {

    @Autowired
    private RegisterValidator registerValidator;

    @Autowired
    private UserService userService;

    @Autowired
    private EmailAuthentication emailAuthentication;

    @Autowired
    private EmailEncryption emailEncryption;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String register(Model model) {

        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String register(@ModelAttribute("userForm") User user, BindingResult bindingResult, Model model) throws MessagingException {

        registerValidator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(user);
        User user2 = userService.findByUsername(user.getUsername());
        emailAuthentication.generateAndSendEmail(user2);

        return "index";
    }

    @RequestMapping(value = "/registration/{email}/{id}", method = RequestMethod.GET)
    public String registerAuthentication(@PathVariable String email, @PathVariable String id, Model model) throws Exception {

        String emailDecrypted = emailEncryption.decrypt(email);
        Long userID = Long.parseLong(id);
        User user = userService.findByUsername(emailDecrypted);
        System.out.println(emailDecrypted + "  **********************************************************************");
        System.out.println(user.getPassword() + "  **********************************************************************"+user.getPasswordConfirm());
        if (user.getId() == userID) {

            user.setActive(1);

            if (user.getUserType().equals("simple")) {

                userService.setActive(user.isActive(), user.getId());
                System.out.println(user.getPassword() + "  **********************************************************************");
                //securityService.autologin(user.getUsername(), user.getPasswordConfirm());
                System.out.println("***********" + user.getUsername() + " " + user.getPassword() + "*******");
                return "redirect:/";
            } else {

                model.addAttribute("nannyForm", new Nanny(user.getId(), user.getUsername(), user.getPasswordConfirm()));
                model.addAttribute("user", user);

                return "registrationExtends";
            }
        } else
            return "404";
    }

    @RequestMapping(value = "/registrationExtends", method = RequestMethod.POST)
    public String registerExtends(@ModelAttribute("nannyForm") Nanny nanny, HttpServletRequest request) {

        userService.save(nanny);
        securityService.autologin(nanny.getUsername(), nanny.getPassword());
        return "/";
    }
}
