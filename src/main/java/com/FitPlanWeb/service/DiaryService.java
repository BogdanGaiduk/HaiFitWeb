package com.FitPlanWeb.service;

import com.FitPlanWeb.service.ForDiaryService.*;
import com.FitPlanWeb.domain.*;
import com.FitPlanWeb.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService  {
    private final ProductsRepo productsRepo;
    private final DiaryLogic diaryLogic;

    @Autowired
    public DiaryService(ProductsRepo productsRepo, DiaryLogic diaryLogic) {
        this.productsRepo = productsRepo;
        this.diaryLogic = diaryLogic;
    }

/*  Метод для расчета суточной потребности калорий */
    public Long calorieRequirement(User user){
        ManOrWoman manOrWoman =new ManOrWoman(user);

        Long calorieRequirement= 0L;
        if (user.getGender().equals("Мужской")) {
            calorieRequirement= manOrWoman.forMan();
        }else if (user.getGender().equals("Женский")){
            calorieRequirement=manOrWoman.forWoman();
        }else {
            System.out.println("error");
        }
        return calorieRequirement;
    }

/*  Метод для расчета РСК (Рекомендуемое Суточное Количество калорий или РСК) */
    public Long RSK(double caloriesBreakfast, double calories){
        return Math.round ((caloriesBreakfast/calories)*100);
    }

/*  Методы для работы с датой для дневника
*   метод filterByDateForDiary - для перевода пустого значения даты в дату сегоднешнего дня
*/
    public String filterByDateForDiary(String filterByDate){
        if (filterByDate.equals("")) {
            filterByDate = diaryLogic.datess.DayAndMonthAndYearForDiary(0);
        }
        return filterByDate  ;
    }

    public String filterDayOfWeekForDiary(String filterByDate){
        String dayOfWeek = diaryLogic.datess.DayOfWeekForDiary(filterByDate);
        return dayOfWeek  ;
    }

/*  Метод для добавления записи в дневник для завтрака, дневника, ужина и перекуса */
    public void addDiary(Integer id, Integer productWeight, String date, User userDiary,Diary diary) {
        Products productAdd = (Products) productsRepo.findById(id);

        double productWeightDouble = Double.valueOf(productWeight);//вес продукта в Double
/*  Умножаем вес продукта на его характеристики в 100 граммах и получаем БЖУ, микроэлементы и калории добавленого продукта */

        double proteinDouble =  Math.round(((productWeightDouble * productAdd.getProtein()) / 100)*100.0)/100.0;
        double fatDouble =  Math.round(((productWeightDouble * productAdd.getFat())/ 100)*100.0)/100.0;
        double carbohydratesDouble = Math.round(((productWeightDouble * productAdd.getCarbohydrates()) / 100)*100.0)/100.0;

        double sugarDouble = Math.round(((productWeightDouble * productAdd.getSugar()) / 100)*100.0)/100.0;
        double celluloseDouble = Math.round(((productWeightDouble * productAdd.getCellulose()) / 100)*100.0)/100.0;
        double sodiumDouble = Math.round(((productWeightDouble * productAdd.getSodium()) / 100)*100.0)/100.0;
        double transFatDouble = Math.round(((productWeightDouble * productAdd.getTransFat()) / 100)*100.0)/100.0;
        double potassiumDouble = Math.round(((productWeightDouble * productAdd.getPotassium()) / 100)*100.0)/100.0;
        double saturatedFatDouble = Math.round(((productWeightDouble * productAdd.getSaturatedFat()) / 100)*100.0)/100.0;

        Integer caloriesInt = productWeight * productAdd.getCalories() / 100 ;//калорий

        if (diary==diaryLogic.diaryBreakfastRepo){
            DiaryBreakfast diaryBreakfast = new DiaryBreakfast(productAdd.getTheProductsName(), Integer.valueOf(productWeight),
                    proteinDouble, fatDouble, carbohydratesDouble, caloriesInt,
                    date, sugarDouble, celluloseDouble, sodiumDouble, transFatDouble, potassiumDouble, saturatedFatDouble, userDiary);
            diaryLogic.diaryBreakfastRepo.save(diaryBreakfast);
        }
        if (diary==diaryLogic.diaryDinnerRepo){
            DiaryDinner diaryDinner = new DiaryDinner(productAdd.getTheProductsName(), Integer.valueOf(productWeight),
                    proteinDouble, fatDouble, carbohydratesDouble, caloriesInt,
                    date, sugarDouble, celluloseDouble, sodiumDouble, transFatDouble, potassiumDouble, saturatedFatDouble, userDiary);
            diaryLogic.diaryDinnerRepo.save(diaryDinner);
        }
        if (diary==diaryLogic.diaryEveningRepo){
            DiaryEvening diaryEvening = new DiaryEvening(productAdd.getTheProductsName(), Integer.valueOf(productWeight),
                    proteinDouble, fatDouble, carbohydratesDouble, caloriesInt,
                    date, sugarDouble, celluloseDouble, sodiumDouble, transFatDouble, potassiumDouble, saturatedFatDouble, userDiary);
            diaryLogic.diaryEveningRepo.save(diaryEvening);
        }
        if (diary==diaryLogic.diarySnackRepo){
            DiarySnack diarySnack = new DiarySnack(productAdd.getTheProductsName(), Integer.valueOf(productWeight),
                    proteinDouble, fatDouble, carbohydratesDouble, caloriesInt,
                    date, sugarDouble, celluloseDouble, sodiumDouble, transFatDouble, potassiumDouble, saturatedFatDouble, userDiary);
            diaryLogic.diarySnackRepo.save(diarySnack);
        }
    }

/*  Методы для расчета общей суммы всех КБЖУ и микроэлементов из добавленых продуктов с разных таблиц БД (завтрака, обеда, ужина и перекуса)*/
    public Long sumCalories(String filterByDate, User user){
        return diaryLogic.calories(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.calories(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.calories(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.calories(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumProtein(String filterByDate, User user){
        return diaryLogic.protein(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.protein(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.protein(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.protein(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumFat(String filterByDate,User user){

        return diaryLogic.fat(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.fat(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.fat(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.fat(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumCarbohydrates(String filterByDate,User user){
        return diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diarySnackRepo);
    }

    public Long sumSugar(String filterByDate,User user){
        return diaryLogic.sugar(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.sugar(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.sugar(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.sugar(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumCellulose(String filterByDate,User user){
        return diaryLogic.cellulose(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.cellulose(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.cellulose(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.cellulose(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumSodium(String filterByDate,User user){
        return diaryLogic.sodium(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.sodium(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.sodium(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.sodium(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumTransFat(String filterByDate,User user){
        return diaryLogic.transFat(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.transFat(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.transFat(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.transFat(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumPotassium(String filterByDate,User user){
        return diaryLogic.potassium(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.potassium(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.potassium(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.potassium(filterByDate,user, diaryLogic.diarySnackRepo);
    }
    public Long sumSaturatedFat(String filterByDate,User user){
        return diaryLogic.saturatedFat(filterByDate,user, diaryLogic.diaryBreakfastRepo)
                + diaryLogic.saturatedFat(filterByDate,user, diaryLogic.diaryDinnerRepo)
                + diaryLogic.saturatedFat(filterByDate,user, diaryLogic.diaryEveningRepo)
                + diaryLogic.saturatedFat(filterByDate,user, diaryLogic.diarySnackRepo);
    }

/*  Метод для расчета процентного соотношения по употреблению калорий */
    public Long percentForCalories(double caloriesBreakfasts, double caloriesDinners, double caloriesEvenings,
                                   double caloriesSnacks,double RSK) {
        return Math.round((caloriesBreakfasts+caloriesDinners+caloriesEvenings+caloriesSnacks)/RSK*100);
    }

/*  Методы для расчета процентного соотношения БЖУ */
    public Long percentProtein(String filterByDate, User user){
       double sumPFC = this.sumProtein(filterByDate,user)+
               this.sumFat(filterByDate,user)+
               this.sumCarbohydrates(filterByDate,user);
       double percentProteinFloat =((this.sumProtein(filterByDate, user)/sumPFC)*100);
        return Math.round(percentProteinFloat);
    }
    public Long percentFat(String filterByDate, User user){
        double sumPFC = this.sumProtein(filterByDate,user)+
                this.sumFat(filterByDate,user)+
                this.sumCarbohydrates(filterByDate,user);
        double percentProteinFloat =((this.sumFat(filterByDate, user)/sumPFC)*100);
        return Math.round(percentProteinFloat);
    }
    public Long percentCarbohydrates(String filterByDate, User user){
        double sumPFC = this.sumProtein(filterByDate,user)+
                this.sumFat(filterByDate,user)+
                this.sumCarbohydrates(filterByDate,user);
        double percentProteinFloat =((this.sumCarbohydrates(filterByDate, user)/sumPFC)*100);
        return Math.round(percentProteinFloat);
    }

/*  Используется для изменения продукта для пользователя Admin */
    public void editProduct( String theProductsName, String manufacturer, double protein, double fat,
                             double carbohydrates, Integer calories, Double sugar, Double cellulose,
                             Double sodium, Double transFat, Double potassium, Double saturatedFat, Products productNow) {
        if(!theProductsName.equals("")){
            productNow.setTheProductsName(theProductsName);
        }
        if(!manufacturer.equals("")){
            productNow.setManufacturer(manufacturer);
        }
        if(protein != 0){
            productNow.setProtein(protein);
        }
        if(fat != 0){
            productNow.setFat(fat);
        }
        if(carbohydrates != 0){
            productNow.setCarbohydrates(carbohydrates);
        }
        if(!calories.equals("")){
            productNow.setCalories(calories);
        }
        if(!sugar.equals("")){
            productNow.setSugar(sugar);
        }
        if(!cellulose.equals("")){
            productNow.setCellulose(cellulose);
        }
        if(!sodium.equals("")){
            productNow.setSodium(sodium);
        }
        if(!transFat.equals("")){
            productNow.setTransFat(transFat);
        }
        if(!potassium.equals("")){
            productNow.setPotassium(potassium);
        }
        if(!saturatedFat.equals("")){
            productNow.setSaturatedFat(saturatedFat);
        }
     productsRepo.save(productNow);
    }
}