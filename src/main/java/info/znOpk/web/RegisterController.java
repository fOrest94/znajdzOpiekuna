package info.znOpk.web;

import info.znOpk.DTO.OfferCareDAO;
import info.znOpk.DTO.SearchCareDAO;
import info.znOpk.authentication.EmailEncryption;
import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;
import info.znOpk.service.OfferCareService;
import info.znOpk.service.SearchCareService;
import info.znOpk.service.UserService;
import info.znOpk.authentication.EmailAuthentication;
import info.znOpk.validator.OfferCareValidator;
import info.znOpk.validator.SearchCareValidator;
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
    private SearchCareValidator searchCareValidator;

    @Autowired
    private OfferCareValidator offerCareValidator;

    @Autowired
    private UserService userService;

    @Autowired
    private OfferCareService offerCareService;

    @Autowired
    private SearchCareService searchCareService;

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
        user.setDateOfBirth(user.getDobDay()+"-"+user.getDobMonth()+"-"+user.getDobYear());

        System.out.println(user.getDateOfBirth()+" hahahahahahha");
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(user);
        emailAuthentication.generateAndSendEmail(user);

        return "redirect:/index";
    }

    @RequestMapping(value = "/registrationOffer", method = RequestMethod.POST)
    public String registerOfferAuthentication(@ModelAttribute("offerCare") OfferCareDAO offerCareDAO, BindingResult result, Model model) {

        offerCareValidator.validate(offerCareDAO, result);

        if (result.hasErrors()) {
            return "registrationOffer";
        }
        OfferCare offerCare = offerCareValidator.getSearchValues(offerCareDAO);

        userService.updateSalaryAndBirthDate(offerCare.getMoneyPerHour(), offerCare.getUserId());
        offerCareService.save(offerCare);
        return "redirect:/";
    }

    @RequestMapping(value = "/registrationSearch", method = RequestMethod.POST)
    public String registerSearchAuthentication(@ModelAttribute("searchCare") SearchCareDAO searchCareDAO, BindingResult result, Model model) {

        searchCareValidator.validate(searchCareDAO, result);

        if (result.hasErrors()) {
            return "registrationSearch";
        }
        SearchCare searchCare = searchCareValidator.getSearchValues(searchCareDAO);
        userService.updateSalaryAndBirthDate(searchCare.getMoneyPerHour(),searchCare.getUserId());
        searchCareService.save(searchCare);
        return "redirect:/";
    }

    @RequestMapping(value = "/registration/{email}/{id}", method = RequestMethod.GET)
    public String registerAuthentication(@PathVariable String email, @PathVariable Long id, Model model) throws Exception {

        String emailDecrypted = emailEncryption.decrypt(email);
        User user = userService.findByUsername(emailDecrypted);

        if (user.getId() == id) {

            user.setActive(1);
            userService.setActive(user.isActive(), user.getId());

            if (user.getUserType() == 1) {

                model.addAttribute("searchCare", new SearchCareDAO());
                model.addAttribute("user", user);
                return "registrationSearch";
            } else {

                model.addAttribute("offerCare", new OfferCareDAO());
                model.addAttribute("user", user);
                return "registrationOffer";
            }
        } else
            return "redirect:/404";
    }
}
