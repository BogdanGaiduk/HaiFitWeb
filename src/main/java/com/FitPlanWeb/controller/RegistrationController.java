package com.FitPlanWeb.controller;

import com.FitPlanWeb.additional.Datess;
import com.FitPlanWeb.additional.Random;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.MessageService;
import com.FitPlanWeb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;

@Controller
public class RegistrationController {

    private final UserService userService;
    private final MessageService messageService;
    private final Datess datess;
    private final Random random;
    private final UserRepo userRepo;
    @Autowired
    public RegistrationController(UserService userService, MessageService messageService,
                                  Datess datess, Random random, UserRepo userRepo) {
        this.userService = userService;
        this.messageService = messageService;
        this.datess = datess;
        this.random = random;
        this.userRepo = userRepo;
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        //Выборка для стран
        String[] country={"Абхазия","Australia","الجزائر","Argentina","Беларусь","България","Brasil",
                "United Kingdom","Deutschland","Italia","Қазақстан","Canada","Monaco","Россия","USA","Türkiye","Uganda",
                "Україна","France","Hrvatska","Česko","Schweiz","Jamaica","日本"};
        model.addAttribute("country",country);

        //Для даты сегодняшнего дня
        Calendar calendar = new GregorianCalendar();
        //День
        model.addAttribute("for_day",datess.DayNowForRegistration(calendar));
        //Месяц
        model.addAttribute("for_month",datess.MonthNowForRegistration(calendar));
        //Год
        model.addAttribute("for_year",datess.YearNowForRegistration(calendar));
        model.addAttribute("random",random.random());

        return "registrationPage";
    }


    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        if (!userService.addUser(user)) {
            model.put("message", "User exists!");
            return "registrationError";
        }
        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);
        if (isActivated) {
            messageService.sendMessageActivateSuccess(code);
        } else {
            System.out.println("error RegistrationController metod activate ");
        }
        return "redirect:/main";
    }
}