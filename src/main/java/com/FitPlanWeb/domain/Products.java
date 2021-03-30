package com.FitPlanWeb.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Products {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Integer id;
    private String theProductsName;
    private String manufacturer;
    private double protein;
    private double fat;
    private double carbohydrates;
    private Integer calories;
    private double sugar;
    private double cellulose;
    private double sodium;
    private double transFat;
    private double potassium;
    private double saturatedFat;


    public Products() {
    }

    public Products(String theProductsName, String manufacturer, double protein, double fat,
                    double carbohydrates, Integer calories, double sugar, double cellulose, double sodium,
                    double transFat, double potassium, double saturatedFat) {
        this.theProductsName = theProductsName;
        this.manufacturer = manufacturer;
        this.protein = protein;
        this.fat = fat;
        this.carbohydrates = carbohydrates;
        this.calories = calories;
        this.sugar = sugar;
        this.cellulose = cellulose;
        this.sodium = sodium;
        this.transFat = transFat;
        this.potassium = potassium;
        this.saturatedFat = saturatedFat;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTheProductsName() {
        return theProductsName;
    }

    public void setTheProductsName(String theProductsName) {
        this.theProductsName = theProductsName;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
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