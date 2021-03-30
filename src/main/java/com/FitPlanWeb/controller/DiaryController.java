package com.FitPlanWeb.controller;

import com.FitPlanWeb.domain.*;
import com.FitPlanWeb.repos.*;
import com.FitPlanWeb.service.DiaryService;
import com.FitPlanWeb.service.ForDiaryService.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DiaryController {

    private final DiaryLogic diaryLogic;
    private final ExerciseUserRepo exerciseUserRepo;
    private final ExerciseRepo exerciseRepo;
    private final ProductsRepo productsRepo;
    private final DiaryService diaryService;

    @Autowired
    public DiaryController(ExerciseUserRepo exerciseUserRepo, ExerciseRepo exerciseRepo,
                           ProductsRepo productsRepo, DiaryService diaryService, DiaryLogic diaryLogic
    ) {
        this.exerciseUserRepo = exerciseUserRepo;
        this.exerciseRepo = exerciseRepo;
        this.productsRepo = productsRepo;
        this.diaryService = diaryService;
        this.diaryLogic = diaryLogic;
    }

    //для изменения настроек пользователя
    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("diary/edit/product/{id}")
    public String editProduct(
            @PathVariable Integer id,
            @RequestParam(required = false, defaultValue = "") String theProductsName,
            @RequestParam(required = false, defaultValue = "") String manufacturer,
            @RequestParam(required = false, defaultValue = "") double protein,
            @RequestParam(required = false, defaultValue = "") double fat,
            @RequestParam(required = false, defaultValue = "") double carbohydrates,
            @RequestParam(required = false, defaultValue = "") Integer calories,
            @RequestParam(required = false, defaultValue = "0") Double sugar,
            @RequestParam(required = false, defaultValue = "0") Double cellulose,
            @RequestParam(required = false, defaultValue = "0") Double sodium,
            @RequestParam(required = false, defaultValue = "0") Double transFat,
            @RequestParam(required = false, defaultValue = "0") Double potassium,
            @RequestParam(required = false, defaultValue = "0") Double saturatedFat
    ) {
        Products productNow= productsRepo.findById(id);

        diaryService.editProduct(theProductsName, manufacturer, protein, fat, carbohydrates, calories, sugar,
                cellulose, sodium, transFat, potassium, saturatedFat, productNow);

        return "redirect:/admin/product/editor";
    }

//Добавление продуктов в Базу данных проекта
    @PostMapping("/diary/add_products/{redirect}")
    public String addProducts(
            @RequestParam(required = false, defaultValue = "") String theProductsName,
            @RequestParam(required = false, defaultValue = "") String manufacturer,
            @RequestParam(required = false, defaultValue = "") double protein,
            @RequestParam(required = false, defaultValue = "") double fat,
            @RequestParam(required = false, defaultValue = "") double carbohydrates,
            @RequestParam(required = false, defaultValue = "") Integer calories,
            @RequestParam(required = false, defaultValue = "0") Double sugar,
            @RequestParam(required = false, defaultValue = "0") Double cellulose,
            @RequestParam(required = false, defaultValue = "0") Double sodium,
            @RequestParam(required = false, defaultValue = "0") Double transFat,
            @RequestParam(required = false, defaultValue = "0") Double potassium,
            @RequestParam(required = false, defaultValue = "0") Double saturatedFat,
            @PathVariable String redirect)
    {
        Products products = new Products(theProductsName, manufacturer, protein, fat, carbohydrates, calories, sugar,
                cellulose, sodium, transFat, potassium, saturatedFat);
        productsRepo.save(products);
        if (redirect.equals("admin")){ redirect = "admin/product/editor";}
        return "redirect:/"+redirect;
    }

    @PostMapping("/diary/addExercise")
    public String addExercise(@AuthenticationPrincipal User user,
                              @RequestParam(required = false, defaultValue = "") Integer exerciseId,
                              @RequestParam(required = false, defaultValue = "") String date,
                              @RequestParam(required = false, defaultValue = "") Integer minutes
    ){
        Exercise exercise = exerciseRepo.findById(exerciseId);
        int calories = (int) (exercise.getCalories() * minutes * user.getWeight());
        ExerciseUser exerciseUser = new ExerciseUser(exercise.getExercise(),calories,date,exercise.getLink(),user);
        exerciseUserRepo.save(exerciseUser);
        return "redirect:/diary?filterByDate="+date;
    }

//Добавление продуктов в завтрак
    @PostMapping("/diary/addDiaryBreakfast")
    public String addDiaryBreakfast(@AuthenticationPrincipal User userDiary,
                                    @RequestParam Integer id,
                                    @RequestParam(required = false, defaultValue = "") Integer productWeight,
                                    @RequestParam(required = false, defaultValue = "") String date
    ) {
        DiaryBreakfast diaryBreakfast =new DiaryBreakfast();
        diaryService.addDiary(id, productWeight, date, userDiary,diaryLogic.diaryBreakfastRepo);
        return "redirect:/diary?filterByDate="+date;
    }

//Добавление продуктов в обед
    @PostMapping("/diary/addDiaryDinner")
    public String addDiaryDinner(@AuthenticationPrincipal User userDiary,
                                 @RequestParam Integer id,
                                 @RequestParam(required = false, defaultValue = "") Integer productWeight,
                                 @RequestParam(required = false, defaultValue = "") String date
    ) {
        diaryService.addDiary(id, productWeight, date, userDiary, diaryLogic.diaryDinnerRepo);
        return "redirect:/diary?filterByDate="+date;
    }

//Добавление продуктов в ужин
    @PostMapping("/diary/addDiaryEvening")
    public String addDiaryEvening(@AuthenticationPrincipal User userDiary,
                                  @RequestParam Integer id,
                                  @RequestParam(required = false, defaultValue = "") Integer productWeight,
                                  @RequestParam(required = false, defaultValue = "") String date
    ) {
        diaryService.addDiary(id, productWeight, date, userDiary, diaryLogic.diaryEveningRepo);
        return "redirect:/diary?filterByDate="+date;
    }

//Добавление продуктов в перекус
    @PostMapping("/diary/addDiarySnack")
    public String addDiarySnack(@AuthenticationPrincipal User userDiary,
                                @RequestParam Integer id,
                                @RequestParam(required = false, defaultValue = "") Integer productWeight,
                                @RequestParam(required = false, defaultValue = "") String date
    ) {
        diaryService.addDiary(id, productWeight, date, userDiary, diaryLogic.diarySnackRepo);
        return "redirect:/diary?filterByDate="+date;
    }

//Вывод данных на страницу дневника
    @GetMapping("/diary")
    public String diary(@AuthenticationPrincipal User user, Model model,
                        @RequestParam(required = false, defaultValue = "")String filterByDate
    ){
//Получение данных о времени и продуктах

        filterByDate=diaryService.filterByDateForDiary(filterByDate);

        //Вывод даты и дня недели
        model.addAttribute("dateModel",filterByDate);
        model.addAttribute("dayOfWeekNow", diaryService.filterDayOfWeekForDiary(filterByDate));
        DiaryBreakfast diaryTest = new DiaryBreakfast();

        //Вывод записаных продуктов по приемам пищи
        model.addAttribute("diaryBreakfasts", diaryLogic.diaryBreakfast(filterByDate,user));
        model.addAttribute("diaryDinners", diaryLogic.diaryDinner(filterByDate,user));
        model.addAttribute("diaryEvenings", diaryLogic.diaryEvening(filterByDate,user));
        model.addAttribute("diarySnacks", diaryLogic.diarySnack(filterByDate,user));

        //Вывод суточной потребности в калориях
        model.addAttribute("targetCalories", diaryService.calorieRequirement(user));

        //Вывод  КБЖУ по завтраку
        model.addAttribute("caloriesBreakfasts", diaryLogic.calories(filterByDate,user, diaryLogic.diaryBreakfastRepo));
        model.addAttribute("proteinBreakfasts", diaryLogic.protein(filterByDate,user, diaryLogic.diaryBreakfastRepo));
        model.addAttribute("fatBreakfasts", diaryLogic.fat(filterByDate,user, diaryLogic.diaryBreakfastRepo));
        model.addAttribute("carbohydratesBreakfasts", diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryBreakfastRepo));
        model.addAttribute("RSKBreakfasts", diaryService.RSK(diaryLogic.calories(filterByDate,user, diaryLogic.diaryBreakfastRepo),diaryService.calorieRequirement(user)));

        //Вывод  КБЖУ по обеду
        model.addAttribute("caloriesDinners", diaryLogic.calories(filterByDate,user, diaryLogic.diaryDinnerRepo));
        model.addAttribute("proteinDinners", diaryLogic.protein(filterByDate,user, diaryLogic.diaryDinnerRepo));
        model.addAttribute("fatDinners", diaryLogic.fat(filterByDate,user, diaryLogic.diaryDinnerRepo));
        model.addAttribute("carbohydratesDinners", diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryDinnerRepo));
        model.addAttribute("RSKDinners", diaryService.RSK(diaryLogic.calories(filterByDate,user, diaryLogic.diaryDinnerRepo),diaryService.calorieRequirement(user)));

        //Вывод  КБЖУ по ужину
        model.addAttribute("caloriesEvenings", diaryLogic.calories(filterByDate,user, diaryLogic.diaryEveningRepo));
        model.addAttribute("proteinEvenings", diaryLogic.protein(filterByDate,user, diaryLogic.diaryEveningRepo));
        model.addAttribute("fatEvenings", diaryLogic.fat(filterByDate,user, diaryLogic.diaryEveningRepo));
        model.addAttribute("carbohydratesEvenings", diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diaryEveningRepo));
        model.addAttribute("RSKEvenings", diaryService.RSK(diaryLogic.calories(filterByDate,user, diaryLogic.diaryEveningRepo),diaryService.calorieRequirement(user)));

        //Вывод  КБЖУ по перекусу
        model.addAttribute("caloriesSnacks", diaryLogic.calories(filterByDate,user, diaryLogic.diarySnackRepo));
        model.addAttribute("proteinSnacks", diaryLogic.protein(filterByDate,user, diaryLogic.diarySnackRepo));
        model.addAttribute("fatSnacks", diaryLogic.fat(filterByDate,user, diaryLogic.diarySnackRepo));
        model.addAttribute("carbohydratesSnacks", diaryLogic.carbohydrates(filterByDate,user, diaryLogic.diarySnackRepo));
        model.addAttribute("RSKSnacks", diaryService.RSK(diaryLogic.calories(filterByDate,user, diaryLogic.diarySnackRepo),diaryService.calorieRequirement(user)));

        //Вывод суммы всех калориев
        model.addAttribute("sumCalories",diaryService.sumCalories(filterByDate,user));

        //Вывод процентного соотношения
        model.addAttribute("percentForCalories",
                diaryService.percentForCalories(diaryLogic.calories(filterByDate,user, diaryLogic.diaryBreakfastRepo), diaryLogic.calories(filterByDate,user, diaryLogic.diaryDinnerRepo),
                diaryLogic.calories(filterByDate,user, diaryLogic.diaryEveningRepo), diaryLogic.calories(filterByDate,user, diaryLogic.diarySnackRepo),diaryService.calorieRequirement(user))
        );

        //Вывод суммы всех белков
        model.addAttribute("sumProtein",diaryService.sumProtein(filterByDate,user));

        //Вывод суммы всех жиров
        model.addAttribute("sumFat",diaryService.sumFat(filterByDate,user));

        //Вывод суммы всех углеводов
        model.addAttribute("sumCarbohydrates",diaryService.sumCarbohydrates(filterByDate,user));

        //Вывод в процентном соотношении белков,жиров и углеводов
        model.addAttribute("percentProtein",diaryService.percentProtein(filterByDate, user));
        model.addAttribute("percentFat",diaryService.percentFat(filterByDate, user));
        model.addAttribute("percentCarbohydrates",diaryService.percentCarbohydrates(filterByDate, user));

        //Вывод суммы микроелементов
        model.addAttribute("sumSugar",diaryService.sumSugar(filterByDate,user));
        model.addAttribute("sumCellulose",diaryService.sumCellulose(filterByDate,user));
        model.addAttribute("sumPotassium", diaryService.sumPotassium(filterByDate,user));
        model.addAttribute("sumSaturatedFat", diaryService.sumSaturatedFat(filterByDate,user));
        model.addAttribute("sumSodium", diaryService.sumSodium(filterByDate,user));
        model.addAttribute("sumTransFat", diaryService.sumTransFat(filterByDate,user));

        //Вывод данных о всех продуктах и активностях (которые есть в БД), так же о данных пользователя
        model.addAttribute("product", productsRepo.findAll());
        model.addAttribute("exercises", exerciseRepo.findAll());
        model.addAttribute("weight", user.getWeight());
        model.addAttribute("name", user.getName());
        model.addAttribute("surname", user.getSurname());
        model.addAttribute("activity", exerciseUserRepo.findByUserExerciseAndDate(user,filterByDate));
        model.addAttribute("sumActivity", exerciseUserRepo.sumCalories(filterByDate,user));
        //Вывод для шапки страницы для добавления актуального имени и фамилии пользователя
        model.addAttribute("User", user);

        return "diaryPage";
    }
}