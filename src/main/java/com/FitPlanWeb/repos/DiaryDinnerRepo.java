package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.DiaryDinner;
import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiaryDinnerRepo extends CrudRepository<DiaryDinner, Long>,Diary {
    List<DiaryDinner> findByDateAndUserDiary (String Date, User user) ;//используется для нашего фильтра

    @Query("SELECT SUM(calories) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Long sumCalories(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(protein) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumProtein(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(fat) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(carbohydrates) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCarbohydrates(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sugar) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSugar(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(cellulose) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumCellulose(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(sodium) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSodium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(transFat) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumTransFat(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(potassium) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumPotassium(@Param("date")String date, @Param("user")User user );

    @Query("SELECT SUM(saturatedFat) FROM DiaryDinner WHERE date=:date " +
            "AND userDiary=:user ")
    Double sumSaturatedFat(@Param("date")String date, @Param("user")User user );
}