package info.znOpk.web;

import info.znOpk.DTO.SearchForm;
import info.znOpk.model.Message;
import info.znOpk.model.User;
import info.znOpk.service.BrowseService;
import info.znOpk.service.MessageService;
import info.znOpk.service.NewsService;
import info.znOpk.service.SessionService;
import info.znOpk.validator.AgeValidator;
import info.znOpk.validator.SearchValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private BrowseService browseService;

    @Autowired
    private SearchValidator searchValidator;

    @Autowired
    private AgeValidator ageValidator;

    @Autowired
    private MessageService messageService;

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        return "index";
    }

    @RequestMapping(value = "/indexService", method = RequestMethod.GET)
    public String indexService(@ModelAttribute("searchForm") @Valid SearchForm searchForm, BindingResult bindingResult, Model model) {

        System.out.println(searchForm.toString());
        searchValidator.validate(searchForm, bindingResult);
// <form:hidden path="username" value="${pageContext.request.userPrincipal.name}"/>
        if (bindingResult.hasErrors()) {
            return "index";
        }
        System.out.println(searchForm.toString());
       // if (searchForm.getTypeOfUser().length() < 7) {

            if (searchForm.getUsername().length() >0) {
                User user = sessionService.getUser(searchForm.getUsername());
                List<Message> messageList = messageService.getUnreadMessById(user.getId());
                model.addAttribute("unreadMess",messageList.size());
                model.addAttribute("user", user);
            }

            if (searchValidator.checkAddress(searchForm.getAddress()).equals("town")) {System.out.println(searchForm.toString());
                List<User> userList = browseService.browseTown(searchForm.getTypeOfUser(), searchForm.getAddress());System.out.println(searchForm.toString());
                for (User usr: userList) {System.out.println(searchForm.toString());
                    usr.setAge(ageValidator.getAgeOfUser(usr.getDateOfBirth()));
                }System.out.println(searchForm.toString());
                model.addAttribute("browseList", userList);

            } else if (searchValidator.checkAddress(searchForm.getAddress()).equals("zipCode")) {
                List<User> userList = browseService.browseZipCode(searchForm.getTypeOfUser(), searchForm.getAddress());
                for (User usr: userList) {
                    System.out.println(usr.toString());
                    usr.setAge(ageValidator.getAgeOfUser(usr.getDateOfBirth()));
                }
                model.addAttribute("browseList", userList);

            }
            model.addAttribute("newsList", newsService.findAllNews());
            return "/indexService";

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
