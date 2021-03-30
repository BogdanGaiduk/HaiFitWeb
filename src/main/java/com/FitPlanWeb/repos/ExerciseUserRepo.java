package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.ExerciseUser;
import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExerciseUserRepo extends JpaRepository<ExerciseUser,Long> {

    List<ExerciseUser> findByUserExerciseAndDate(User user, String date);

    @Query("SELECT SUM(calories) FROM ExerciseUser WHERE date=:date " +
            "AND userExercise=:user ")
    Integer sumCalories(@Param("date")String date, @Param("user")User user );
}
