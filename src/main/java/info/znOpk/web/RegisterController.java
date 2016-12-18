package info.znOpk.web;

import info.znOpk.authentication.EmailEncryption;
import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;
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
        emailAuthentication.generateAndSendEmail(user);

        return "redirect:/index";
    }

    @RequestMapping(value = "/registrationOffer", method = RequestMethod.GET)
    public String registerOfferAuthentication(@ModelAttribute("offerForm") OfferCare nanny, Model model) {

        userService.save(nanny);
        return "redirect:/";
    }

    @RequestMapping(value = "/registrationSearch", method = RequestMethod.GET)
    public String registerSearchAuthentication(@ModelAttribute("searchForm") SearchCare searchCare, Model model) {

        userService.save(searchCare);
        return "redirect:/";
    }

    @RequestMapping(value = "/registration/{email}/{id}", method = RequestMethod.GET)
    public String registerAuthentication(@PathVariable String email, @PathVariable String id, Model model) throws Exception {

        String emailDecrypted = emailEncryption.decrypt(email);
        Long userID = Long.parseLong(id);
        User user = userService.findByUsername(emailDecrypted);

        if (user.getId() == userID) {

            user.setActive(1);
            userService.setActive(user.isActive(), user.getId());

            if (user.getUserType().equals("simple")) {

                return "redirect:/";
            } else {

                model.addAttribute("nannyForm", new OfferCare(user.getId(), user.getUsername(), user.getPasswordConfirm()));
                model.addAttribute("user", user);

                return "redirect:/registrationOffer";
            }
        } else
            return "redirect:/404";
    }
}
