package com.FitPlanWeb.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Exercise {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String exercise;
    private double calories;
    private String link;

    public Exercise() {
    }

    public Exercise(String exercise, Double calories, String link) {
        this.exercise = exercise;
        this.calories = calories;
        this.link = link;
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

    public Double getCalories() {
        return calories;
    }

    public void setCalories(Double calories) {
        this.calories = calories;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}