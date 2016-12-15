package info.znOpk.web;

import info.znOpk.model.User;
import info.znOpk.service.BrowseService;
import info.znOpk.service.SessionService;
import info.znOpk.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private BrowseService browseService;

    @Autowired
    private UserValidator userValidator;

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

    @RequestMapping(value = "/indexServiceSimple", method = RequestMethod.GET)
    public String indexService(@RequestParam("userType")String userType, Model model) {

        List<User> browseList = browseService.browseResults(userType);
        model.addAttribute("browseList", browseList);

        return "indexService";
    }

    @RequestMapping(value = "/indexService", method = RequestMethod.GET)
    public String indexService(@RequestParam("userType")String userType, HttpServletRequest request, Model model) {

            if((request.getUserPrincipal().getName() != null)){
                User user = sessionService.getUser(request.getUserPrincipal().getName());
                model.addAttribute("user",user);
            }

        List<User> browseList = browseService.browseResults(userType);
        model.addAttribute("browseList", browseList);

        return "indexService";
    }
}
