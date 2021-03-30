package com.FitPlanWeb.domain;

import javax.persistence.*;

@Entity
public class ExerciseUser {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String exercise;
    private Integer calories;
    private String date;
    private String link;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User userExercise;


    public  ExerciseUser(){}

    public ExerciseUser(String exercise, Integer calories, String date, String link, User userExercise) {
        this.exercise = exercise;
        this.calories = calories;
        this.date = date;
        this.link = link;
        this.userExercise = userExercise;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExercise() {
        return exercise;
    }

    public void setExercise(String exercise) {
        this.exercise = exercise;
    }

    public Integer getCalories() {
        return calories;
    }

    public void setCalories(Integer calories) {
        this.calories = calories;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public User getUserExercise() {
        return userExercise;
    }

    public void setUserExercise(User userExercise) {
        this.userExercise = userExercise;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}