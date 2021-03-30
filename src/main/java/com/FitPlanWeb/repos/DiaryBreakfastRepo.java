package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.DiaryBreakfast;
import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiaryBreakfastRepo extends JpaRepository<DiaryBreakfast, Long>,Diary {
    List<DiaryBreakfast> findByDateAndUserDiary(String Date, User user);//используется для нашего фильтра

    @Query("SELECT SUM(calories) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Long sumCalories(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(protein) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumProtein(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(fat) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(carbohydrates) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCarbohydrates(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sugar) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSugar(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(cellulose) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCellulose(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sodium) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSodium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(transFat) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumTransFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(potassium) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumPotassium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(saturatedFat) FROM DiaryBreakfast WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSaturatedFat(@Param("date")String date, @Param("user")User user );
}