package info.znOpk.web;

import info.znOpk.DTO.OfferCareDAO;
import info.znOpk.DTO.SearchCareDAO;
import info.znOpk.model.*;
import info.znOpk.service.*;
import info.znOpk.validator.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private FileValidator fileValidator;

    @Autowired
    private SearchCareValidator searchCareValidator;

    @Autowired
    private OfferCareValidator offerCareValidator;

    @Autowired
    private AgeValidator ageValidator;

    @Autowired
    private MarkValidator markValidator;

    @Autowired
    private MessageService messageService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private SearchCareService searchCareService;

    @Autowired
    private OfferCareService offerCareService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/writeToMe", method = RequestMethod.GET)
    public String writeToMe(HttpServletRequest request, Model model) {
        return "writeToMe";
    }

    @RequestMapping(value = "/advancedMyProfile", method = RequestMethod.GET)
    public String userSettings(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userSettings";
    }

    @RequestMapping(value = "/editMyProfile", method = RequestMethod.GET)
    public String editProfile(Principal principal, Model model) {

        User user = sessionService.getUser(principal.getName());
        user.setAge(ageValidator.getAgeOfUser(user.getDateOfBirth()));
        File fileModel = new File();

        if (user.getUserType() == 2) {
            model.addAttribute("offerCare", new OfferCareDAO());
        } else if (user.getUserType() == 1) {
            model.addAttribute("searchCare", new SearchCareDAO());
        }
        List<Message> messageList = messageService.getUnreadMessById(user.getId());

        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("whatShow", 1);
        model.addAttribute("user", user);

        return "editProfile";
    }

    @RequestMapping(value = "/editMyProfile", method = RequestMethod.POST)
    public String editProfileSave(@Valid File fileBucket, @ModelAttribute("offerCare") OfferCareDAO offerCareDAO,
                                  @ModelAttribute("searchCare") SearchCareDAO searchCareDAO,
                                  HttpServletRequest request, BindingResult result, Model model) throws IOException {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        user.setAge(ageValidator.getAgeOfUser(user.getDateOfBirth()));
        if (user.getUserType() == 2 && offerCareDAO.getUserId() != null) {
            offerCareValidator.validate(offerCareDAO, result);

            if (result.hasErrors()) {
                return "registrationOffer";
            }
            OfferCare offerCare = offerCareValidator.getSearchValues(offerCareDAO);
            offerCareService.update(offerCare);
            model.addAttribute("offerCare", new OfferCareDAO());
        } else if (user.getUserType() == 1 && searchCareDAO.getUserId() != null) {

            searchCareValidator.validate(searchCareDAO, result);

            if (result.hasErrors()) {
                return "registrationSearch";
            }
            SearchCare searchCare = searchCareValidator.getSearchValues(searchCareDAO);
            searchCareService.update(searchCare);
            model.addAttribute("searchCare", new SearchCareDAO());
        }

        String uploadLocation = request.getSession().getServletContext().getRealPath("/") + "resources\\pictures\\profileImages\\";
        String fileName = user.getId() + ".jpg";

        try {

            MultipartFile multipartFile = fileBucket.getFile();
            multipartFile.transferTo(new java.io.File(uploadLocation + fileName));

        } catch (Exception e) {
            System.out.println("Brak zdjęcia");
        }

        File fileModel = new File();
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("whatShow", 1);
        model.addAttribute("user", user);
        return "editProfile";
    }

    @RequestMapping(value = "/showMyProfile", method = RequestMethod.GET)
    public String showMyProfile(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        user.setAge(ageValidator.getAgeOfUser(user.getDateOfBirth()));

        if (user.getUserType() == 1) {

            SearchCare searchCare = sessionService.getSearchUser(user.getId());
            model.addAttribute("userParent", searchCare);

        } else if (user.getUserType() == 2) {

            OfferCare nanny = sessionService.getCareUser(user.getId());
            model.addAttribute("userNanny", nanny);
        }

        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("userName", user.getFirstName());
        model.addAttribute("userToShow", user);
        model.addAttribute("whatShow", 1);

        return "showProfile";
    }

    @RequestMapping(value = "/showProfile", method = RequestMethod.POST)
    public String showProfile(@RequestParam("userId") Long userId, @RequestParam("userLogged") String userLog, Model model) {

        User userToShow = sessionService.getUser(userId);
        userToShow.setAge(ageValidator.getAgeOfUser(userToShow.getDateOfBirth()));
        if (userLog != null) {

            User userLogged = sessionService.getUser(userLog);
            List<Message> messageList = messageService.getUnreadMessById(userLogged.getId());
            model.addAttribute("unreadMess",messageList.size());
            model.addAttribute("userName", userLogged.getFirstName());
            model.addAttribute("commentForm", new Comment());
            model.addAttribute("commentsList", commentService.getComments1(userToShow.getId()));
        }

        if (userToShow.getUserType() == 1) {
            SearchCare searchCare;
            searchCare = sessionService.getSearchUser(userToShow.getId());
            model.addAttribute("userParent", searchCare);
        }else if (userToShow.getUserType() == 2) {
            OfferCare nanny;
            nanny = sessionService.getCareUser(userToShow.getId());
            model.addAttribute("userNanny", nanny);
        }


        model.addAttribute("userToShow", userToShow);
        model.addAttribute("whatShow", 0);

        return "/showProfile";
    }

    @RequestMapping(value = "/showProfile/{id}", method = RequestMethod.POST)
    public String showNews(@PathVariable("id") Long id, @ModelAttribute("commentForm") Comment comment, @RequestParam("radio") String radio,
                           BindingResult bindingResult, Model model, Principal principal) {

        User userToShow = sessionService.getUser(id);
        User user = sessionService.getUser(principal.getName());

        if (bindingResult.hasErrors()) {
            return "/";
        }

        if (userToShow.getUserType() == 1) {
            SearchCare searchCare;
            searchCare = sessionService.getSearchUser(userToShow.getId());
            model.addAttribute("userParent", searchCare);
        }else if (userToShow.getUserType() == 2) {
            OfferCare nanny = sessionService.getCareUser(userToShow.getId());
            model.addAttribute("userNanny", nanny);
        }

        if(comment.getComment_description() != null){
            comment.setLastName(user.getLastName());
            comment.setUserId(user.getId());
            comment.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
            commentService.saveComment(comment);
        }
        else if(!radio.equals("0")){
            markValidator.addMark(radio, userToShow.getId());
        }

        userToShow.setAge(ageValidator.getAgeOfUser(userToShow.getDateOfBirth()));
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("userToShow", userToShow);
        model.addAttribute("whatShow", 0);
        model.addAttribute("userName", sessionService.getUser(principal.getName()).getFirstName());
        model.addAttribute("commentForm", new Comment());
        model.addAttribute("commentsList", commentService.getComments1(userToShow.getId()));

        return "/showProfile";
    }

    @RequestMapping(value = "/advancedSettings", method = RequestMethod.GET)
    public String advancedSettings(Principal principal, Model model) {

        User user = sessionService.getUser(principal.getName());
        List<Message> messageList = messageService.getUnreadMessById(user.getId());
        model.addAttribute("unreadMess",messageList.size());
        model.addAttribute("user", user);
        return "userSettings";
    }

    @RequestMapping(value = "/advancedSettings", method = RequestMethod.POST)
    public String advancedSettings(){

        return "userSettings";
    }

    @InitBinder("fileBucket")
    protected void initBinderFileBucket(WebDataBinder binder) {
        binder.setValidator(fileValidator);
    }
}
