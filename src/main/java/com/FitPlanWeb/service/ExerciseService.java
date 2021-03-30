package com.FitPlanWeb.service;

import com.FitPlanWeb.domain.Exercise;
import com.FitPlanWeb.repos.ExerciseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ExerciseService {

    private final ExerciseRepo exerciseRepo;
    @Autowired
    public ExerciseService(ExerciseRepo exerciseRepo) {
        this.exerciseRepo = exerciseRepo;
    }

    public void saveExercise(String exercise, Double calories, String link, String uploadPath, MultipartFile file)
    {
        Exercise exerciseObject = new Exercise(exercise, calories, link);
        exerciseRepo.save(exerciseObject);

    }
}