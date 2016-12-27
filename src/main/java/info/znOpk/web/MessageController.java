package info.znOpk.web;

import info.znOpk.model.Message;
import info.znOpk.model.User;
import info.znOpk.service.MessageService;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by DuduŚ on 2016-12-25.
 */
@Controller
public class MessageController {

    @Autowired
    UserService userService;

    @Autowired
    MessageService messageService;

    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET)
    public String sendMessage(@PathVariable("id") Long id, Model model, Principal principal) {

        User user = userService.findByUsername(principal.getName());
        model.addAttribute("user", user);

        if(id > 0){
            User user_recipient = userService.findById(id);
            model.addAttribute("recipient_data", user_recipient.getFirstName()+" "+user_recipient.getLastName());
            model.addAttribute("messageForm", new Message(user.getId(), id));
        }
        else {
            model.addAttribute("recipient_data", "0");
            model.addAttribute("messageForm", new Message(user.getId()));
        }
        List<Message> messages = messageService.getMessagesById(user.getId());
        System.out.println("pierdolone studaia w chuj "+messages.size()+ " haha");
        model.addAttribute("massagesList", messages);
        return "/message";
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute("messageForm") Message message, Principal principal, BindingResult bindingResult, Model model){

        message.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
        messageService.save(message);

        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "/";
    }

}
