package com.FitPlanWeb.controller;

import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.MessageService;
import com.FitPlanWeb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/*
* Контроллер для перехода на страницу пользователя
* */
@Controller
@RequestMapping("/user")
public class UserController {

    private final UserRepo userRepo;
    private final UserService userService;
    private final MessageService messageService;
    @Autowired
    public UserController(UserRepo userRepo, UserService userService, MessageService messageService){
        this.userRepo=userRepo;
        this.userService = userService;
        this.messageService = messageService;
    }

//Для вывода данных об настройках пользователя
    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        User userNow= userRepo.findById(user.getId());
        model.addAttribute("User", userNow);
        model.addAttribute("Month_of_birth",userService.forDateOfBirth(userNow));
        model.addAttribute("country",userService.country);//для вывода всех стран
        model.addAttribute("coefficient",userService.profileForCoefficient(userNow));
        model.addAttribute("target",userService.profileForTarget(userNow));

        return "settingsPages";
    }

//Для изменения настроек пользователя
    @PostMapping("edit")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false, defaultValue = "") String name,
            @RequestParam(required = false, defaultValue = "") String surname,
            @RequestParam(required = false, defaultValue = "") String email,
            @RequestParam(required = false, defaultValue = "") String country,
            @RequestParam(required = false, defaultValue = "") Double weight,
            @RequestParam(required = false, defaultValue = "") Double height,
            @RequestParam(required = false, defaultValue = "") Double coefficient,
            @RequestParam(required = false, defaultValue = "") String target,
            @RequestParam(required = false, defaultValue = "") String password
            ) {
        User userNow= userRepo.findById(user.getId());
        userService.updateProfile(userNow, name, surname, email, country, password, weight,height,
                coefficient, target);

        return "redirect:/user/profile";
    }

//Для верефикации пользователя
    @PostMapping("activated")
    public String activatedProfile(@AuthenticationPrincipal User user
    ){
        if (!user.getCode().equals("activated")){
            messageService.sendRepeatMessage(user);
        }

        return "redirect:/user/profile";
    }
}
