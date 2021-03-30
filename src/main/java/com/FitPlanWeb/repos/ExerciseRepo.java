package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.Exercise;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ExerciseRepo extends CrudRepository<Exercise, Long> {

    List<Exercise> findAll();
    Exercise findById(Integer id);

}
