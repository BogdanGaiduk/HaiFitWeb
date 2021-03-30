package com.FitPlanWeb.service.ForDiaryService;

import com.FitPlanWeb.additional.Datess;
import com.FitPlanWeb.domain.*;
import com.FitPlanWeb.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/*
* Класс создан для получения данных о КБЖУ и микроэлементов с БД и так же их общей суммы
*/
@Component
public class DiaryLogic {
    public final Datess datess;
    public final DiaryBreakfastRepo diaryBreakfastRepo;
    public final DiaryDinnerRepo diaryDinnerRepo;
    public final DiaryEveningRepo diaryEveningRepo;
    public final DiarySnackRepo diarySnackRepo;

    @Autowired
    public DiaryLogic(Datess datess, DiaryBreakfastRepo diaryBreakfastRepo,
                      DiaryDinnerRepo diaryDinnerRepo, DiaryEveningRepo diaryEveningRepo,
                      DiarySnackRepo diarySnackRepo) {
        this.datess = datess;
        this.diaryBreakfastRepo = diaryBreakfastRepo;
        this.diaryDinnerRepo = diaryDinnerRepo;
        this.diaryEveningRepo = diaryEveningRepo;
        this.diarySnackRepo = diarySnackRepo;
    }

/* Получение данных по дате и пользователю для завтрака, обеда, перекуса и ужина */
    public Iterable<DiaryBreakfast> diaryBreakfast(String filterByDate, User user) {
        Iterable<DiaryBreakfast> diaryBreakfasts ;
        if (filterByDate != null && !filterByDate.isEmpty()) {
            diaryBreakfasts = diaryBreakfastRepo.findByDateAndUserDiary(filterByDate,user);
        } else {
            diaryBreakfasts = diaryBreakfastRepo.findByDateAndUserDiary(datess.DayAndMonthAndYearForDiary(0),user);
        }
        return diaryBreakfasts;
    }
    public Iterable<DiaryDinner> diaryDinner(String filterByDate, User user) {
        Iterable<DiaryDinner> diaryDinners ;
        if (filterByDate != null && !filterByDate.isEmpty()) {
            diaryDinners = diaryDinnerRepo.findByDateAndUserDiary(filterByDate,user);
        } else {
            diaryDinners = diaryDinnerRepo.findByDateAndUserDiary(datess.DayAndMonthAndYearForDiary(0),user);
        }
        return diaryDinners;
    }
    public  Iterable<DiaryEvening> diaryEvening (String filterByDate, User user) {
        Iterable<DiaryEvening> diaryEvenings  ;
        if (filterByDate != null && !filterByDate.isEmpty()) {
            diaryEvenings = diaryEveningRepo.findByDateAndUserDiary(filterByDate,user);
        } else {
            diaryEvenings = diaryEveningRepo.findByDateAndUserDiary(datess.DayAndMonthAndYearForDiary(0),user);
        }
        return diaryEvenings;
    }
    public Iterable<DiarySnack> diarySnack (String filterByDate, User user) {
        Iterable<DiarySnack> diarySnacks ;
        if (filterByDate != null && !filterByDate.isEmpty()) {
            diarySnacks =  diarySnackRepo.findByDateAndUserDiary(filterByDate,user);
        } else {
            diarySnacks = diarySnackRepo.findByDateAndUserDiary(datess.DayAndMonthAndYearForDiary(0),user);
        }
        return diarySnacks;
    }


/* Получение данных о сумме КБЖУ и микроэлементах для завтрака, обеда, перекуса и ужина */
    public Long calories (String filterByDate, User user, Diary diary){
        long calories  = 0L;
        try {
            calories = diary.sumCalories(filterByDate, user);//
        }catch (Exception ex){
            return calories ;
        }
        return calories;
    }

    public long protein (String filterByDate, User user, Diary diary){
        long protein  = 0L;
        try{
            protein=Math.round((diary.sumProtein(filterByDate, user)* 100.00) / 100.00);
        }catch (Exception ex){
            return protein;
        }
        return protein;
    }

    public long fat (String filterByDate, User user, Diary diary){
        long fat  = 0L;
        try{
            fat=Math.round((diary.sumFat(filterByDate, user)* 100.00) / 100.00);
        }catch (Exception ex){
            return fat;
        }
        return fat;
    }

    public long carbohydrates (String filterByDate, User user, Diary diary){
        long carbohydrates = 0L;
        try{
            carbohydrates=Math.round((diary.sumCarbohydrates(filterByDate, user)* 100.00) / 100.00);
        }catch (Exception ex){
            return carbohydrates;
        }
        return carbohydrates;
    }

    public long sugar (String filterByDate, User user, Diary diary){
        long sugar = 0L;
        try {
            sugar = Math.round(diary.sumSugar(filterByDate, user));
        }catch (Exception ex){
            return sugar ;
        }
        return sugar;
    }

    public long cellulose (String filterByDate, User user, Diary diary){
        long cellulose = 0L;
        try {
            cellulose = Math.round(diary.sumCellulose(filterByDate, user));
        }catch (Exception ex){
            return cellulose ;
        }
        return cellulose;
    }

    public long sodium (String filterByDate, User user, Diary diary){
        long sodium = 0L;
        try {
            sodium = Math.round(diary.sumSodium(filterByDate, user));
        }catch (Exception ex){
            return sodium ;
        }
        return sodium;
    }

    public long transFat (String filterByDate, User user, Diary diary){
        long transFat = 0L;
        try {
            transFat = Math.round(diary.sumTransFat(filterByDate, user));
        }catch (Exception ex){
            return transFat ;
        }
        return transFat;
    }

    public long potassium (String filterByDate, User user, Diary diary){
        long potassium = 0L;
        try {
            potassium = Math.round(diary.sumPotassium(filterByDate, user));
        }catch (Exception ex){
            return potassium ;
        }
        return potassium;
    }

    public long saturatedFat (String filterByDate, User user, Diary diary){
        long saturatedFat = 0L;
        try {
            saturatedFat = Math.round(diary.sumSaturatedFat(filterByDate, user));
        }catch (Exception ex){
            return saturatedFat ;
        }
        return saturatedFat;
    }
}