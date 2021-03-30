package com.FitPlanWeb.service;

import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class MessageService {

    private final MailSender mailSender;
    private final UserRepo userRepo;

    @Autowired
    public MessageService(MailSender mailSender, UserRepo userRepo) {
        this.mailSender = mailSender;
        this.userRepo = userRepo;
    }

    public void sendPasswordLink(User user){
        String message =String.format(
                "Привет, %s %s \n"+
                        "Если вы забыли пароль и хотите его обновить, то перейдите по ссылке снизу: \n"+
                        "http://localhost:8080/activateCodePassword/%s",
                user.getName(),
                user.getSurname(),
                user.getCodeUpdatePassword()
        );
        mailSender.send(user.getUsername(),"Password",message);
    }

    public void passwordChangeSuccessful(User user){
        String message = String.format(
                "%s %s, ваш пароль был успешно изменен! \uD83D\uDE0E",
                user.getName(),
                user.getSurname()
        );
        mailSender.send(user.getUsername(), "Password change successful", message);
    }

/*  Первое сообщение после регистрации */
    public void sendMessage(User user) {
        if(!StringUtils.isEmpty(user.getUsername())){
            String message = String.format(
                    "Привет, %s %s! \uD83E\uDD17 \n" +
                            "⚡Добро пожаловать в HaiFit. \n" +
                            "Пожалуйста, перейдите по ссылке для верификации: http://localhost:8080/activate/%s",
                    user.getName(),
                    user.getSurname(),
                    user.getCode()
            );
            user.getCode();
            mailSender.send(user.getUsername(),"code", message);
        }
    }

/*  Повторная отправка сообщения для верификации */
    public void sendRepeatMessage(User user){
        System.out.println("sendRepeatMessage 3");
        String message = String.format(
                "Добрый день, %s %s! \uD83E\uDD17 \n" +
                        "Пожалуйста, перейдите по ссылке для верификации: http://localhost:8080/activate/%s",
                user.getName(),
                user.getSurname(),
                user.getCode()
        );
        mailSender.send(user.getUsername(),"code", message);
    }

    public void sendMessageActivateSuccess(String code){
        User user = userRepo.findByCode(code);
        if(!StringUtils.isEmpty(user.getUsername())) {
            String message = String.format(
                    "Привет, %s %s! \uD83E\uDD17 \n" +
                            "Ваш аккаунт активирован\uD83E\uDD73\t \n" +
                            "Теперь, вы имеете обширные возможности на нашем сервисе ! ",
                    user.getName(),
                    user.getSurname());
            mailSender.send(user.getUsername(), "Activate", message);
            user.setCode("activated");
            userRepo.save(user);
        }
    }
}