package com.FitPlanWeb.service.ForUserService;

import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
public class UserSettings {

    private final PasswordEncoder passwordEncoder;
    private final UserRepo userRepo;
    private final MessageService messageService;

    @Autowired
    private UserSettings(PasswordEncoder passwordEncoder, UserRepo userRepo, MessageService messageService) {
        this.passwordEncoder = passwordEncoder;
        this.userRepo = userRepo;
        this.messageService = messageService;
    }

    public User updateProfile(User user, String name, String surname, String email, String country, String password,
                              Double weight, Double height, Double coefficient, String target) {
        String userEmail = user.getUsername();
        boolean isEmailChanged = (email != null && !email.equals(userEmail) && !email.equals("")) ||
                (userEmail != null && !userEmail.equals(email) && !email.equals(""));
        if (isEmailChanged) {
            user.setUsername(email);
            if (!StringUtils.isEmpty(email)) user.setCode(UUID.randomUUID().toString());
        }
        if (isEmailChanged) messageService.sendMessage(user);

        if(!name.equals("")) user.setName(name);

        if(!surname.equals("")) user.setSurname(surname);

        if(!country.equals("")) user.setCountry(country);

        if(!password.equals("")) user.setPassword(passwordEncoder.encode(password));

        if(weight!=null) user.setWeight(weight);

        if(height!=null) user.setHeight(height);

        if(coefficient!=null) user.setCoefficient(coefficient);

        if(!target.equals("")) user.setTarget(target);
        userRepo.save(user);

        return user;
    }

    public void updateFitFaceProfile(MultipartFile file, String uploadPath, User user)
            throws IOException {
        if (file!=null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));
            user.setFilename(resultFilename);
        }
    }

    public String profileForCoefficient(User user){
        int c = 0;
        String[] coefficient={"Активность не указана","Сидячая работа",
                "Легкие упражнения (1-2 раза в неделю)",
                "Легкие упражнения (4-5 раз в неделю)",
                "Интенсивные тренировки","Ежедневные тренировки",
                "Ежедневные интенсивные тренировки",
                "Интенсивные тренировки 2 раза в день"};

        if (user.getCoefficient()==1.2){
//                c="Сидячая работа";
            c=1;
        }
        if (user.getCoefficient()==1.375){
//                c="Легкие упражнения (1-2 раза в неделю)";
            c=2;
        }
        if (user.getCoefficient()==1.462){
//                c="Легкие упражнения (4-5 раз в неделю)";
            c=3;
        }
        if (user.getCoefficient()==1.550){
//                c="Интенсивные тренировки";
            c=4;
        }
        if (user.getCoefficient()==1.637){
//                c="Ежедневные тренировки";
            c=5;
        }
        if (user.getCoefficient()==1.725){
//                c="Ежедневные интенсивные тренировки";
            c=6;
        }
        if (user.getCoefficient()==1.9){
//                c="Интенсивные тренировки 2 раза в день";
            c=7;
        }
        return coefficient[c];
    }

    public String profileForTarget(User user){
        int t=0;
        String[] target ={"Нет цели...", "Поддержание веса","Похудение","Набор веса"};
        if(user.getTarget().equals("1")){
            t=1;
        }
        if(user.getTarget().equals("2")){
            t=2;
        }
        if(user.getTarget().equals("3")){
            t=3;
        }
        return target[t];
    }
}