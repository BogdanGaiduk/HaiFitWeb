package com.FitPlanWeb.service;

import com.FitPlanWeb.domain.Message;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.MessageRepo;
import com.FitPlanWeb.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SearchService {

    private final MessageRepo messageRepo;
    private final UserRepo userRepo;

    @Autowired
    public SearchService(MessageRepo messageRepo, UserRepo userRepo) {
        this.messageRepo = messageRepo;
        this.userRepo = userRepo;
    }

    public List<User> searchUser (String search, String filterByPeople, String filterByFitLenta){
        String name = search;
        String surname = search;
        List<User> users = new ArrayList<User>();

        if (search.equals("") ){
            users = userRepo.findAll();
        }

        if (search!=null && !search.isEmpty() && filterByPeople.equals("true") && filterByFitLenta.equals("false")) {
            try {
                users = userRepo.findByNameOrSurname(name, surname);
                if (users.size()==0){
                    String[] words = search.split("\\s"); // Разбиение строки на слова с помощью разграничителя (пробел)
                    users = userRepo.findByNameAndSurname(words[0], words[1]);
                }
            }catch (Exception ex){ }
        }

        return users;
    }

/*  Поиск постов по тегам */
    public List<Message> searchMessage (String search, String filterByFitLenta){
        List<Message> messages = new ArrayList <Message>();
        if (search!= null && !search.isEmpty() && filterByFitLenta.equals("true")) {
            try {
                messages = messageRepo.findByTag(search);

            } catch (Exception ex){}
        }
        return messages;
    }
}