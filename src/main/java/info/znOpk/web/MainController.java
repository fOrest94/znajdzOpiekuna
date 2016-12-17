package info.znOpk.web;

import info.znOpk.DTO.DTOSearch.SearchForm;
import info.znOpk.model.User;
import info.znOpk.service.BrowseService;
import info.znOpk.service.SessionService;
import info.znOpk.validator.SearchValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class MainController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private BrowseService browseService;

    @Autowired
    private SearchValidator searchValidator;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/indexServiceAll", method = RequestMethod.GET)
    public String indexServiceAll(@ModelAttribute("searchForm") @Valid SearchForm searchForm, BindingResult result, Model model) {

        searchValidator.validate(searchForm, result);
        if (result.hasErrors()) {
            return "index";
        } else {
            if (searchValidator.checkAddress(searchForm.getAddress()).equals("town")) {
                model.addAttribute("browseList", browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress()));
            } else if (searchValidator.checkAddress(searchForm.getAddress()).equals("zipCode")) {
                model.addAttribute("browseList", browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress()));
            }
            return "indexService";
        }
    }

    @RequestMapping(value = "/indexService", method = RequestMethod.GET)
    public String indexService(@ModelAttribute("searchForm") @Valid SearchForm searchForm, BindingResult result, Principal principal, Model model) {

        searchValidator.validate(searchForm, result);
        if (result.hasErrors()) {
            return "index";
        } else {

            if(principal.getName() != null){
                User user = sessionService.getUser(principal.getName());
                model.addAttribute("user", user);
            }

            if (searchValidator.checkAddress(searchForm.getAddress()).equals("town")) {
                model.addAttribute("browseList", browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress()));
            } else if (searchValidator.checkAddress(searchForm.getAddress()).equals("zipCode")) {
                model.addAttribute("browseList", browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress()));
            }
            return "indexService";
        }
    }

    @ModelAttribute("searchForm")
    public SearchForm createModel() {
        return new SearchForm();
    }
}
