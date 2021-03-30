package com.FitPlanWeb.service.ForDiaryService;

import com.FitPlanWeb.domain.User;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
/*
* Класс в котором происходит подсчет необходимого количества калорий для мужчины и женчины
* */
public class ManOrWoman {
    private final User user;
    private long calories= 0;
    private final double height;
    private final double weight;
    private final double coefficient;
    private LocalDate date = LocalDate.now();
    private int age;


    public ManOrWoman(User user) {
        this.height = user.getHeight();
        this.weight = user.getWeight();
        this.coefficient = user.getCoefficient();
        this.user =user;
        age(user);
    }

    private void age(User user){
        date = date.minusYears(Integer.parseInt(user.getYear_of_birth()));
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yy");
        age = Integer.parseInt(date.format(format));//актуальны возраст
    }
    private long target(String s,long caloriesToMaintain){
        if (s.equals("1")) {
            calories = caloriesToMaintain;
        } else if (s.equals("2")) {
            double mDoudle = caloriesToMaintain * 0.2;
            calories =Math.round (caloriesToMaintain - mDoudle);
        } else if (s.equals("3")) {
            double mDoudle = caloriesToMaintain * 0.15;
            calories = Math.round(caloriesToMaintain + mDoudle);
        }
        return calories;
    }

    public Long forMan (){
        double voo =  66.47 + (13.75 * weight) + (5.0 * height) - (6.74 * age);
        double sdd = (voo * 10) / 100;//СДД
        long manCalories = Math.round((voo + sdd) * user.getCoefficient());//(для поддержания)
        return target(user.getTarget(),manCalories);
    }

    public Long forWoman (){
        double voo =  655.1 + 9.6 * weight + 1.85 * height - 4.68 * age;//ВОО
        double sdd = (voo * 10) / 100;//СДД
        long womanCalories = Math.round((voo + sdd) * coefficient);//(для поддержания)
        return target(user.getTarget(),womanCalories);
    }
}