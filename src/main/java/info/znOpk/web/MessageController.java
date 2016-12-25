package info.znOpk.web;

import info.znOpk.model.Message;
import info.znOpk.model.User;
import info.znOpk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

/**
 * Created by DuduŚ on 2016-12-25.
 */
@Controller
public class MessageController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET)
    public String sendMessage(@PathVariable("id") Long id, Model model, Principal principal) {

        User user_recipient = userService.findById(id);
        User user = userService.findByUsername(principal.getName());

        model.addAttribute("user", user);
        model.addAttribute("recipient_data", user_recipient.getFirstName()+" "+user_recipient.getLastName());
        model.addAttribute("messageForm", new Message(user.getId(), id));

        return "redirect:/message";
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute("messageForm") Message message, Principal principal, BindingResult bindingResult, Model model){

        System.out.println(message.toString());

        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "redirect:/indexService";
    }
}
