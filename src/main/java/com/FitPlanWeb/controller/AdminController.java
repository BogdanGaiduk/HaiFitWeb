package com.FitPlanWeb.controller;

import com.FitPlanWeb.domain.Products;
import com.FitPlanWeb.domain.Role;
import com.FitPlanWeb.domain.User;
import com.FitPlanWeb.repos.ExerciseRepo;
import com.FitPlanWeb.repos.ProductsRepo;
import com.FitPlanWeb.repos.UserRepo;
import com.FitPlanWeb.service.ExerciseService;
import com.FitPlanWeb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final ExerciseService exerciseService;
    private final ExerciseRepo exerciseRepo;
    private final UserRepo userRepo;
    private final ProductsRepo productsRepo;
    @Value("${upload.path}")
    private String uploadPath;
    @Autowired
    public AdminController(UserService userService, ExerciseService exerciseService,
                           ExerciseRepo exerciseRepo, UserRepo userRepo,
                           ProductsRepo productsRepo) {
        this.userService = userService;
        this.exerciseService = exerciseService;
        this.exerciseRepo = exerciseRepo;
        this.userRepo = userRepo;
        this.productsRepo = productsRepo;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users",userService.findAll());

        return "adminUserList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{userId}")
    public String userEditForm(@PathVariable Integer userId, Model model){
        User user = userRepo.findById(userId);
        model.addAttribute("user",user);
        model.addAttribute("roles", Role.values());

        return "adminUserEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("save")
    public String userSave(@RequestParam String username,
                           @RequestParam Map<String,String> form,
                           @RequestParam("userId")Integer userId){
        userService.saveUser(userRepo.findById(userId),username,form);

        return "redirect:/admin";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("exercise/editor")
    public String exercise(@AuthenticationPrincipal User user, Model model){
//        userService.saveUser(userRepo.findById(userId),username,form);
        model.addAttribute("User",user);
        model.addAttribute("Exercise", exerciseRepo.findAll());
        return "adminExerciseEditor";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("exercise/add")
    public String exerciseAdd(
            @RequestParam String exercise,
            @RequestParam Double calories,
            @RequestParam String link,
            @RequestParam("filename") MultipartFile file //для добавления файла на сервер
    ) throws IOException {
        exerciseService.saveExercise(exercise, calories, link, uploadPath, file);

        return "redirect:/admin/exercise/editor";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("product/editor")
    public String product(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("User",user);
        model.addAttribute("Products", productsRepo.findAll());
        return "adminProductEditor";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("product/get/delete/{id}")
    public String deleteProductGet(@AuthenticationPrincipal User user,
                                @PathVariable Integer id, Model model){
          model.addAttribute("ObjectIDDelete", id);
          model.addAttribute("ObjectDelete", productsRepo.findById(id).getTheProductsName());
          model.addAttribute("linkForm", "/admin/product/delete/");
          model.addAttribute("linkBack", "/admin/product/editor");
          return "adminDeletePage";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("product/delete/{id}")
    public String deleteProduct(@PathVariable Integer id) {
        productsRepo.delete(productsRepo.findById(id));
        return "redirect:/admin/product/editor";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("product/get/edit/{id}")
    public String editProduct(@PathVariable Integer id,Model model){
        model.addAttribute("product",productsRepo.findById(id));
        return "adminEditProduct";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("product/search/by")
    public String searchProduct(
            @RequestParam (required = false, defaultValue = "0") Integer searchId,
            @RequestParam (required = false, defaultValue = "")String searchProduct,
            Model model){
        List<Products> searchList=new ArrayList<Products>();

        if (!searchProduct.equals("")||searchId!=0 ){
            if(productsRepo.findByTheProductsName(searchProduct)!=null){
                searchList.add(productsRepo.findByTheProductsName(searchProduct));}
            if(productsRepo.findById(searchId)!=null){
                searchList.add(productsRepo.findById(searchId));}
            model.addAttribute("Products", searchList);
        }else {
            model.addAttribute("Products",productsRepo.findAll());
        }

        return "adminProductEditor";
    }
}