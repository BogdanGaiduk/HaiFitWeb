package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.DiaryBreakfast;
import com.FitPlanWeb.domain.User;

import java.util.List;

public interface Diary {
    List findByDateAndUserDiary(String Date, User user);

    Long sumCalories(String date, User user);

    Double sumProtein(String date, User user );

    Double sumFat(String date, User user );

    Double sumCarbohydrates(String date, User user );

    Double sumSugar(String date, User user );

    Double sumCellulose(String date, User user );

    Double sumSodium(String date, User user );

    Double sumTransFat(String date, User user );

    Double sumPotassium(String date, User user );

    Double sumSaturatedFat(String date, User user );
}