package com.FitPlanWeb.controller;

import com.FitPlanWeb.additional.Datess;
import com.FitPlanWeb.domain.Message;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.MessageRepo;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.MainService;
import com.FitPlanWeb.service.SearchService;
import com.FitPlanWeb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Controller
public class MainController {
    private final MessageRepo messageRepo;
    private final Datess datess;
    private final UserService userService;
    private final SearchService searchService;
    private final MainService mainService;
    private final UserRepo userRepo;
    @Autowired
    public MainController(MessageRepo messageRepo, Datess datess, UserService userService,
                          SearchService searchService, MainService mainService,
                          UserRepo userRepo) {
        this.messageRepo = messageRepo;
        this.datess = datess;
        this.userService = userService;
        this.searchService = searchService;
        this.mainService = mainService;
        this.userRepo = userRepo;
    }

    //с помощью аннотации Value идет поиск пути
    // куда нужно будет сгружать файлы, которые будут приходить на сервер
    //в данном случае будет  искатся эта строчка описаная в Value
    //которая находится в application.properties
    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "redirect:/main";
    }

    @GetMapping("/search")
    public String search(@AuthenticationPrincipal User user,
                         @RequestParam(required = false, defaultValue = "")String search,
                         @RequestParam(required = false, defaultValue = "true")String filterByPeople,
                         @RequestParam(required = false, defaultValue = "false")String filterByFitLenta,
                         Model model){
        model.addAttribute("messages",searchService.searchMessage(search, filterByFitLenta));
        model.addAttribute("users", searchService.searchUser(search, filterByPeople, filterByFitLenta));
        model.addAttribute("User", user);

        return "searchPage";
    }

    @GetMapping("/main")
    public String main(@AuthenticationPrincipal User userNow,
                       @RequestParam(required = false, defaultValue = "")String filter,
                       Model model) {

        User user= userRepo.findById(userNow.getId());

        model.addAttribute("messages", messageRepo.findAll());
        model.addAttribute("filter",filter);
        model.addAttribute("User", user);
        model.addAttribute("name",user.getName());
        model.addAttribute("surname",user.getSurname());

        ArrayList<User> list = new ArrayList<User>();
        if(user.getSubscriptions().size()>5) {
            for (int x = 0; x < 5; x++) {
                list.add((User) user.getSubscriptions().toArray()[x]);
            }
        }else {
            for (int x=0; x<user.getSubscriptions().size();x++){
                list.add((User) user.getSubscriptions().toArray()[x]);
            }
        }
        model.addAttribute("users", list);

        return "mainPage";
    }

    @PostMapping("/main/avatar")
    public String avatar(
            @AuthenticationPrincipal User user,
            @RequestParam("files") MultipartFile file
            )throws IOException {
        userService.updateFitFaceProfile(file,uploadPath,user);
        return "redirect:/main";
    }

    @PostMapping("/main/add")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Date forTime= new Date();
        Calendar forDate = new GregorianCalendar();
        Message message = new Message(text, tag, user, datess.DayAndMonthNowForMain(forDate), datess.TimeNowForMain(forTime));

        mainService.addPicture(file, uploadPath,message);

        return "redirect:/main";
    }

    @GetMapping("/main/edit_login_password")
    public String edit_login_password(Model model){
        model.addAttribute("message", "");
        return "edit_login_password";
    }

    @PostMapping("/main/edit_login_password")
    public String post_edit_login_password(@RequestParam ("username") String username,
                                           Model model){
        if (!userService.usernameСomparison(username)) {
            model.addAttribute("message", "Такого пользователя не существует. Не верный e-mail.");
            return "edit_login_password";
        }
        return "redirect:/login";
    }

//Активация нового пароля
    @GetMapping("/activateCodePassword/{code}")
    public String activateCodePassword(Model model, @PathVariable String code) {
        try {
            model.addAttribute("mail", userRepo.findByCodeUpdatePassword(code).getUsername());
            model.addAttribute("code", code);
        }catch (Exception ex){
            return "redirect:/login";
        }
        return "editPasswordPage";
    }

    @PostMapping("/activateCodePassword/newPassword/{code}")
    public String testing(@RequestParam ("password") String password,
                          @PathVariable String code){
        userService.passwordChangeSuccessful(code,password);
        return "redirect:/login";
    }
}