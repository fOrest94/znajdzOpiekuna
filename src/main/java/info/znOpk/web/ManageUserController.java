package info.znOpk.web;

import info.znOpk.model.User;
import info.znOpk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

/**
 * Created by DuduŚ on 2016-12-27.
 */
@Controller
public class ManageUserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/usersManagement", method = RequestMethod.GET)
    public String confirmIdentity(Principal principal, Model model) {

        User user = userService.findByUsername(principal.getName());
        List<User> userList = userService.findAll();

        model.addAttribute("user", user);
        model.addAttribute("userList", userList);
        return "usersManagement";
    }

    @RequestMapping(value = "/usersManagement", method = RequestMethod.POST)
    public String confirmIdentity(@RequestParam("id") Long id,@RequestParam("operation") String operation,
                                  Model model, Principal principal){

        if(operation.equals("identity"))
            userService.confirmIdentity(id);
        else if(operation.equals("delete"))
            userService.deleteUser(id);

        User user = userService.findByUsername(principal.getName());
        List<User> userList = userService.findAll();

        model.addAttribute("user", user);
        model.addAttribute("userList", userList);

        return "usersManagement";
    }

}
