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

        System.out.print("co jest");
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
        for (Message message: messages) {
            User user1 = userService.findById(message.getIdSender());
            message.setFirstName(user1.getFirstName());
            message.setLastName(user1.getLastName());
        }
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("massagesList", messages);
        return "/message";
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute("messageForm") Message message, Principal principal, BindingResult bindingResult, Model model){

        message.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())).substring(0,19));
        messageService.save(message);

        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "/";
    }

    @RequestMapping(value = "/message/show/{id}", method = RequestMethod.GET)
    public String showMessage(@PathVariable("id") Long id, Model model, Principal principal){

        Message message = messageService.getMessage(id);
        User userMessage = userService.findById(message.getIdSender());
        message.setFirstName(userMessage.getFirstName());
        message.setLastName(userMessage.getLastName());
        message.setEmail(userMessage.getUsername());
        User user = userService.findByUsername(principal.getName());
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("user", user);
        model.addAttribute("readMessage", message);
        return "/";
    }

}
