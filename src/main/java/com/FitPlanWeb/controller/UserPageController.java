package com.FitPlanWeb.controller;

import com.FitPlanWeb.additional.Datess;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.domain.Message;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.MessageRepo;
import com.FitPlanWeb.service.MainService;
import com.FitPlanWeb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

/*
* Контроллер для перехода на страницу другого пользователя
*/
@Controller
@RequestMapping("/user_page")
public class UserPageController {

    private final MessageRepo messageRepo;
    private final MainService mainService;
    private final UserRepo userRepo;
    private final UserService userService;
    private final Datess datess;
    @Autowired
    public UserPageController(MessageRepo messageRepo, MainService mainService, UserRepo userRepo,
                              UserService userService, Datess datess) {
        this.messageRepo = messageRepo;
        this.mainService = mainService;
        this.userRepo = userRepo;
        this.userService = userService;
        this.datess = datess;
    }

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/id:{ids}")
    public String userById( Model model, @PathVariable Integer ids, @AuthenticationPrincipal User currentUser) {
        String page;
        User user =userRepo.findById(currentUser.getId());
        User userPost = userRepo.findById(ids);
        if (!Objects.equals(user.getId(), userPost.getId())) {
            page = "userPageById";
        } else {
            page = "redirect:/user_page";
        }
        Iterable<Message> messages = messageRepo.findByAuthorId(ids);
        model.addAttribute("messages", messages);
        model.addAttribute("User",user );
        model.addAttribute("UserById",userPost);
        model.addAttribute("UserId",userPost.getId());

        model.addAttribute("subscribersCount",userPost.getSubscribers().size());
        model.addAttribute("subscriptionsCount",userPost.getSubscriptions().size());
        model.addAttribute("usersSubscribers", userPost.getSubscribers());
        model.addAttribute("usersSubscriptions", userPost.getSubscriptions());
        return page;
    }

    @GetMapping
    public String userPage(@AuthenticationPrincipal User currentUser,
                            Model model) {
        User user =userRepo.findById(currentUser.getId());
        Iterable<Message> messages = messageRepo.findByAuthor(user);

        model.addAttribute("messages", messages);
        model.addAttribute("User", user);
        model.addAttribute("subscribersCount",user.getSubscribers().size());
        model.addAttribute("subscriptionsCount",user.getSubscriptions().size());

        model.addAttribute("usersSubscribers", user.getSubscribers());
        model.addAttribute("usersSubscriptions", user.getSubscriptions());

        return "userPage";
    }
    @PostMapping("add_post")
    public String addPost(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file //для добавления файла на сервер

    ) throws IOException {
        Date forTime= new Date();
        Calendar forDate = new GregorianCalendar();
        Message message = new Message(text, tag, user, datess.DayAndMonthNowForMain(forDate), datess.TimeNowForMain(forTime));

        mainService.addPicture(file, uploadPath,message);

        return "redirect:/user_page";
    }

    @GetMapping("subscribe/{id}")
    public String subscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Integer id
    ) {
        User user = userRepo.findById(id);
        userService.subscribe(currentUser, user);
        return "redirect:/user_page/id:"+user.getId();
    }
    @GetMapping("unsubscribe/{id}")
    public String unsubscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Integer id
    ) {
        User u = userRepo.findById(currentUser.getId());
        User user = userRepo.findById(id);
        userService.unsubscribe(u, user);

        return "redirect:/user_page/id:"+user.getId();
    }
}