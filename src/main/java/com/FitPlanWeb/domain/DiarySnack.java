package com.FitPlanWeb.domain;

import javax.persistence.*;
@Entity
public class DiarySnack {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String productName;
    private Integer productWeight;
    private double protein;
    private double fat;
    private double carbohydrates;
    private Integer calories;
    private String date;
    private double sugar;
    private double cellulose;
    private double sodium;
    private double transFat;
    private double potassium;
    private double saturatedFat;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User userDiary;

    public DiarySnack() {
    }

    public DiarySnack(String productName, Integer productWeight, double protein, double fat, double carbohydrates,
                      Integer calories, String date, double sugar, double cellulose, double sodium, double transFat,
                      double potassium, double saturatedFat, User userDiary) {
        this.productName = productName;
        this.productWeight = productWeight;
        this.protein = protein;
        this.fat = fat;
        this.carbohydrates = carbohydrates;
        this.calories = calories;
        this.date = date;
        this.sugar = sugar;
        this.cellulose = cellulose;
        this.sodium = sodium;
        this.transFat = transFat;
        this.potassium = potassium;
        this.saturatedFat = saturatedFat;
        this.userDiary = userDiary;
    }

    public User getUserDiary() {
        return userDiary;
    }

    public void setUserDiary(User userDiary) {
        this.userDiary = userDiary;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(Integer productWeight) {
        this.productWeight = productWeight;
    }

    public double getProtein() {
        return protein;
    }

    public void setProtein(double protein) {
        this.protein = protein;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }

    public double getCarbohydrates() {
        return carbohydrates;
    }

    public void setCarbohydrates(double carbohydrates) {
        this.carbohydrates = carbohydrates;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getCalories() {
        return calories;
    }

    public void setCalories(Integer calories) {
        this.calories = calories;
    }

    public double getSugar() {
        return sugar;
    }

    public void setSugar(double sugar) {
        this.sugar = sugar;
    }

    public double getCellulose() {
        return cellulose;
    }

    public void setCellulose(double cellulose) {
        this.cellulose = cellulose;
    }

    public double getSodium() {
        return sodium;
    }

    public void setSodium(double sodium) {
        this.sodium = sodium;
    }

    public double getTransFat() {
        return transFat;
    }

    public void setTransFat(double transFat) {
        this.transFat = transFat;
    }

    public double getPotassium() {
        return potassium;
    }

    public void setPotassium(double potassium) {
        this.potassium = potassium;
    }

    public double getSaturatedFat() {
        return saturatedFat;
    }

    public void setSaturatedFat(double saturatedFat) {
        this.saturatedFat = saturatedFat;
    }
}
