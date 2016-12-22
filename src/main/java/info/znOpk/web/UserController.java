package info.znOpk.web;

import info.znOpk.DTO.OfferCareDAO;
import info.znOpk.DTO.SearchCareDAO;
import info.znOpk.model.FileUpload;
import info.znOpk.model.OfferCare;
import info.znOpk.model.SearchCare;
import info.znOpk.model.User;
import info.znOpk.service.OfferCareService;
import info.znOpk.service.SearchCareService;
import info.znOpk.service.SessionService;
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
import java.io.File;
import java.io.IOException;
import java.security.Principal;

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
    private SessionService sessionService;

    @Autowired
    private SearchCareService searchCareService;

    @Autowired
    private OfferCareService offerCareService;

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
        FileUpload fileModel = new FileUpload();

        if (user.getUserType() == 2) {
            model.addAttribute("offerCare", new OfferCareDAO());
        }
        else if (user.getUserType() == 1) {
            model.addAttribute("searchCare", new SearchCareDAO());
        }

        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("whatShow", 1);
        model.addAttribute("user", user);

        return "editProfile";
    }

    @RequestMapping(value = "/editMyProfile", method = RequestMethod.POST)
    public String editProfileSave(@Valid FileUpload fileBucket, @ModelAttribute("offerCare") OfferCareDAO offerCareDAO,
                                  @ModelAttribute("searchCare") SearchCareDAO searchCareDAO,
                                  HttpServletRequest request, BindingResult result, Model model) throws IOException {

        User user = sessionService.getUser(request.getUserPrincipal().getName());

        if (user.getUserType() == 2) {
            offerCareValidator.validate(offerCareDAO, result);

            if (result.hasErrors()) {
                return "registrationOffer";
            }
            OfferCare offerCare = offerCareValidator.getSearchValues(offerCareDAO);
            offerCareService.update(offerCare);
            model.addAttribute("offerCare", new OfferCareDAO());
        } else if (user.getUserType() == 1) {

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

        if (result.hasErrors()) {
            return "singleFileUploader";
        }

        try{

            MultipartFile multipartFile = fileBucket.getFile();
            multipartFile.transferTo(new File(uploadLocation + fileName));
            model.addAttribute("fileName", fileName);
        }catch (Exception e){System.out.println("Brak zdjęcia");};

        FileUpload fileModel = new FileUpload();

        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("whatShow", 1);
        model.addAttribute("user", user);
        return "editProfile";
    }

    @RequestMapping(value = "/showMyProfile", method = RequestMethod.GET)
    public String showMyProfile(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        user.setAge(24);
        FileUpload fileModel = new FileUpload();
        if (user.getUserType() == 2) {
            OfferCare nanny = sessionService.getCareUser(user.getId());
            nanny.setAge(ageValidator.getAgeOfUser(nanny.getDataOfBirth()));
            model.addAttribute("userNanny", nanny);
        } else {
            SearchCare searchCare = sessionService.getSearchUser(user.getId());

            model.addAttribute("userParent", searchCare);
        }

        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("user", user);
        model.addAttribute("whatShow", 1);

        return "showProfile";
    }

    @RequestMapping(value = "/showProfile", method = RequestMethod.GET)
    public String showProfile(@RequestParam("userId") String userId, @RequestParam("userLogged") String userLog, Model model) {

        Long lookId = Long.valueOf(userId).longValue();
        User user = sessionService.getUser(lookId);
        if (userLog != null) {

            User userLogged = sessionService.getUser(userLog);
            model.addAttribute("user", userLogged);
        }

        if (user.getUserType() == 2) {
            OfferCare nanny = sessionService.getCareUser(user.getId());
            nanny.setAge(ageValidator.getAgeOfUser(nanny.getDataOfBirth()));
            model.addAttribute("userNanny", nanny);
        }

        model.addAttribute("userToShow", user);
        model.addAttribute("whatShow", 0);

        return "showProfile";
    }


    @InitBinder("fileBucket")
    protected void initBinderFileBucket(WebDataBinder binder) {
        binder.setValidator(fileValidator);
    }
}
