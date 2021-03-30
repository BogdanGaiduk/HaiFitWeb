package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.DiarySnack;
import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiarySnackRepo extends CrudRepository<DiarySnack, Long>,Diary
{
    List<DiarySnack> findByDateAndUserDiary(String Date, User user) ;//используется для нашего фильтра

    @Query("SELECT SUM(calories) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Long sumCalories(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(protein) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumProtein(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(fat) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(carbohydrates) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCarbohydrates(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sugar) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSugar(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(cellulose) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCellulose(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sodium) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSodium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(transFat) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumTransFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(potassium) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumPotassium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(saturatedFat) FROM DiarySnack WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSaturatedFat(@Param("date")String date, @Param("user")User user );
}