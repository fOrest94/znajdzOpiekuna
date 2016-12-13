package info.znOpk.web;

import info.znOpk.model.FileUpload;
import info.znOpk.model.Nanny;
import info.znOpk.service.SessionService;
import info.znOpk.validator.AgeValidator;
import info.znOpk.validator.FileValidator;
import info.znOpk.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import info.znOpk.model.User;

import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;

@Controller
public class UserController {

    @Autowired
    private AgeValidator ageValidator;

    @Autowired
    FileValidator fileValidator;

    @Autowired
    private SessionService sessionService;

    @RequestMapping(value = "/indexService", method = RequestMethod.GET)
    public String indexService(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user",user);

        return "indexService";
    }

    @RequestMapping(value = "/writeToMe", method = RequestMethod.GET)
    public String writeToMe(HttpServletRequest request, Model model) {
        return "writeToMe";
    }

    @RequestMapping(value = "/userSettings", method = RequestMethod.GET)
    public String userSettings(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userSettings";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String editProfile(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "editProfile";
    }

    @RequestMapping(value = "/showProfile", method = RequestMethod.GET)
    public String showProfile(HttpServletRequest request, Model model) {

        User user = sessionService.getUser(request.getUserPrincipal().getName());
        FileUpload fileModel = new FileUpload();

        if(user.getUserType().equals("sister")){
            Nanny nanny = sessionService.getCareUser(user.getId());
            nanny.setAge(ageValidator.getAgeOfUser(nanny.getDataOfBirth()));
            model.addAttribute("userNanny", nanny);
        }

        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("user", user);

        return "showProfile";
    }

    @RequestMapping(value = "/showProfile", method = RequestMethod.POST)
    public String showProfileUpdate(@Valid FileUpload fileBucket, HttpServletRequest request,
                                    BindingResult result, Model model) throws IOException {

        User user = sessionService.getUser(request.getUserPrincipal().getName());

        if(user.getUserType().equals("sister")){
            Nanny nanny = sessionService.getCareUser(user.getId());
            nanny.setAge(ageValidator.getAgeOfUser(nanny.getDataOfBirth()));
            model.addAttribute("userNanny", nanny);
        }

        String uploadLocation = request.getSession().getServletContext().getRealPath("/") + "resources\\pictures\\profileImages\\";

        if (result.hasErrors()) {
            System.out.println("validation errors");
            return "singleFileUploader";
        } else {

            MultipartFile multipartFile = fileBucket.getFile();
            multipartFile.transferTo(new File(uploadLocation + user.getUsername() + ".jpg"));
            String fileName = user.getUsername() + ".jpg";
            FileUpload fileModel = new FileUpload();

            model.addAttribute("fileBucket", fileModel);
            model.addAttribute("fileName", fileName);
            model.addAttribute("user", user);
            return "showProfile";
        }
    }

    @InitBinder("fileBucket")
    protected void initBinderFileBucket(WebDataBinder binder) {
        binder.setValidator(fileValidator);
    }
}
