package info.znOpk.web;

import info.znOpk.DTO.SearchForm;
import info.znOpk.model.User;
import info.znOpk.service.BrowseService;
import info.znOpk.service.NewsService;
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

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        return "index";
    }

    @RequestMapping(value = "/indexService", method = RequestMethod.GET)
    public String indexService(@ModelAttribute("searchForm") @Valid SearchForm searchForm, BindingResult bindingResult, Model model) {

        searchValidator.validate(searchForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "index";
        }

       // if (searchForm.getTypeOfUser().length() < 7) {

            if (searchForm.getUsername() != null) {
                User user = sessionService.getUser(searchForm.getUsername());
                model.addAttribute("user", user);
            }

            if (searchValidator.checkAddress(searchForm.getAddress()).equals("town")) {
                model.addAttribute("browseList", browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress()));
            } else if (searchValidator.checkAddress(searchForm.getAddress()).equals("zipCode")) {
                model.addAttribute("browseList", browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress()));
            }
            model.addAttribute("newsList", newsService.findAllNews());

            return "indexService";

      /* } else {

            if (searchForm.getUsername() != null) {
                User user = sessionService.getUser(searchForm.getUsername());
                model.addAttribute("user", user);
            }

            String[] result = searchValidator.checkDetailsResearchValues(searchForm.getTypeOfUser());

            if (searchValidator.checkAddress(searchForm.getAddress()).equals("town")) {
                model.addAttribute("browseList", browseService.browseDetailsResultsTown(result[0], result[1], searchForm.getAddress()));
            } else if (searchValidator.checkAddress(searchForm.getAddress()).equals("zipCode")) {
                model.addAttribute("browseList", browseService.browseDetailsResultsZipCode(result[0], result[1], searchForm.getAddress()));
            }
            return "indexService";
        }*/
    }

    @ModelAttribute("searchForm")
    public SearchForm createModel() {
        return new SearchForm();
    }
}
