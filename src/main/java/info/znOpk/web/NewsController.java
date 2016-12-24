package info.znOpk.web;

import info.znOpk.model.News;
import info.znOpk.service.NewsService;
import info.znOpk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by DuduŚ on 2016-12-22.
 */

@Controller
public class NewsController {

    @Autowired
    UserService userService;

    @Autowired
    NewsService newsService;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String showNews(Model model, Principal principal){

        model.addAttribute("user",userService.findByUsername(principal.getName()));
        model.addAttribute("newsList",newsService.findAllNews());

        return "news";

    }

    @RequestMapping(value = "/news", method = RequestMethod.POST)
    public String showNews(){

        return "news";

    }

    @RequestMapping(value = "/newsManagement", method = RequestMethod.GET)
    public String showNewsProfile(Model model, Principal principal){

        model.addAttribute("user", userService.findByUsername(principal.getName()));
        model.addAttribute("newsForm", new News());
        model.addAttribute("newsList", newsService.findAllNews());
        return "newsManagement";

    }

    @RequestMapping(value = "/newsManagement", method = RequestMethod.POST)
    public String showNewsProfile(@ModelAttribute("newsForm") News news, BindingResult bindingResult, HttpServletRequest request, Model model){

        System.err.println(news.toString());
        if(bindingResult.hasErrors())
        {
            return "error";
        }
        news.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
        newsService.saveNews(news);

        String uploadLocation = request.getSession().getServletContext().getRealPath("/") +"resources\\img\\img_news\\";
        String fileName = news.getId() + ".jpg";

        try{

            MultipartFile multipartFile = news.getFile().getFile();
            multipartFile.transferTo(new File(uploadLocation + fileName));
        }catch (Exception e){System.out.println("Brak zdjęcia");};

        model.addAttribute("newsForm" , new News());
        model.addAttribute("user", userService.findByUsername(request.getUserPrincipal().getName()));
        model.addAttribute("newsList", newsService.findAllNews());

        return "newsManagement";

    }

    @RequestMapping(value = "/newsManagement/edit", method = RequestMethod.POST)
    public String deleteNews(@RequestParam("type") String action ,@RequestParam("selectId") Long id, Model model, Principal principal) {

        if(action.equals("edit"))
        {
            System.out.println("ala "+newsService.editNews(id).toString());
            model.addAttribute("newsForm" , newsService.editNews(id));
            model.addAttribute("user", userService.findByUsername(principal.getName()));
            model.addAttribute("newsList", newsService.findAllNews());

            return "redirect:/newsManagement";

        }else if(action.equals("delete"))
        {
            if(newsService.deleteNews(id)){

                model.addAttribute("newsForm" , new News());
                model.addAttribute("user", userService.findByUsername(principal.getName()));
                model.addAttribute("newsList", newsService.findAllNews());

                return "redirect:/newsManagement";
            }
        }
        return "error";
    }


}