package com.FitPlanWeb.service;

import com.FitPlanWeb.domain.Role;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.ForUserService.UserSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
@Service
public class UserService implements UserDetailsService {
    private final UserSettings userSettings ;
    public final UserRepo userRepo;
    public final MessageService messageService;
    public final PasswordEncoder passwordEncoder;
/*
*   Массив со странами для UserController используется при регистрации, а так же в настройках
*/
    public final String[] country={"Абхазия","Australia","الجزائر","Argentina","Беларусь","България","Brasil",
            "United Kingdom","Deutschland","Italia","Қазақстан","Canada","Monaco","Россия","USA","Türkiye","Uganda",
            "Україна","France","Hrvatska","Česko","Schweiz","Jamaica","日本"};

    @Autowired
    public UserService(UserRepo userRepo, MessageService messageService, PasswordEncoder passwordEncoder,
                       UserSettings userSettings
    ) {
        this.userRepo = userRepo;
        this.messageService = messageService;
        this.passwordEncoder = passwordEncoder;
        this.userSettings =userSettings;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return  userRepo.findByUsername(username);
    }

    public List<User> findAll() {
        return  userRepo.findAll();
    }
/*
*   Методы usernameСomparison (проверка в БД пользователя) и passwordChangeSuccessful(удачное изменение пароля)
*   используются для забытого пароля
*/
    public boolean usernameСomparison(String username){
        User userFromDb = userRepo.findByUsername(username);
        if(userFromDb!=null){
            userFromDb.setCodeUpdatePassword(UUID.randomUUID().toString());
            userRepo.save(userFromDb);
            messageService.sendPasswordLink(userFromDb);
            return true;
        }
    return false;
    }

    public void passwordChangeSuccessful(String code,String password){
        User user = userRepo.findByCodeUpdatePassword(code);
        user.setCodeUpdatePassword("");
        userRepo.save(userSettings.updateProfile(user,"","","","",password,null,
                null,null,""));
        messageService.passwordChangeSuccessful(user);
    }

/*  Методы addUser и saveUser для создания и сохранения нового пользователя с ролью User и проверкой
*   на дублирование его е-mail в БД, если такой е-mail уже есть будет ошибка
*/
    public boolean addUser(User user){
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if(userFromDb!=null){
            return false ;
        }
        //Призначение пользователю роли User
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        //Запись ссылки в бд для верефикации, сохранение пользователя и отправка письма
        user.setCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        messageService.sendMessage(user);
        return true;
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepo.save(user);
    }

/*  Метод для верификации пользователя используется в RegistrationController */
    public boolean activateUser(String code) {
        User user = userRepo.findByCode(code);
        if (user == null||user.getCode().equals("activated")) return false;
        return true;
    }
/*
*   Методы для выввода данных пользователя, добавления фото на аватарку и обновления пользовательских настроек
*/

    public String profileForCoefficient(User user){
        return userSettings.profileForCoefficient(user);
    }

    public String profileForTarget(User user){
        return userSettings.profileForTarget(user);
    }

    public void updateFitFaceProfile(MultipartFile file, String uploadPath, User user)
            throws IOException {
            userSettings.updateFitFaceProfile(file,uploadPath,user);
            userRepo.save(user);
    }

    public void updateProfile(User user, String name, String surname, String email, String country, String password,
                              Double weight, Double height, Double coefficient, String target) {
        userSettings.updateProfile( user,  name,  surname,  email,  country, password,
                 weight, height, coefficient,  target);
        userRepo.save(user);
    }

//Метод для вывода, а именно добавления 0 в месяцах рождения 1-9 для регистрации и настроек
    public String forDateOfBirth(User user){
        String month_of_birth;
        if((Integer.parseInt(user.getMonth_of_birth())<10)){
             month_of_birth = "0"+user.getMonth_of_birth();
        }else {
            month_of_birth = user.getMonth_of_birth();
        }
        return month_of_birth;
    }

//Подписки и подписчики
    public void subscribe(User currentUser, User user) {
        user.getSubscribers().add(currentUser);
        userRepo.save(user);
    }

    public void unsubscribe(User currentUser, User user) {
        user.getSubscribers().remove(currentUser);
        userRepo.save(user);
    }
}