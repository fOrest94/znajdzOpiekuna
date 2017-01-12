package info.znOpk.web;

import info.znOpk.model.Message;
import info.znOpk.model.User;
import info.znOpk.service.MessageService;
import info.znOpk.service.RankingService;
import info.znOpk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

/**
 * Created by DuduŚ on 2016-12-30.
 */
@Controller
public class RankingController {

    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private RankingService rankingService;

    @RequestMapping(value = "/ranking", method = RequestMethod.GET)
    public String rankingCare(Model model, Principal principal) {

        User user = userService.findByUsername(principal.getName());
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("user", user);
        model.addAttribute("topOffers", rankingService.getTopOffers());
        model.addAttribute("topCares", rankingService.getTopCare());

        return "ranking";
    }

}
