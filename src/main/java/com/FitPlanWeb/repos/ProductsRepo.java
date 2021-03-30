package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.Products;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductsRepo extends CrudRepository<Products, Long> {
    Products findById(Integer id);
    Products findByTheProductsName(String n);
    List<Products> findAll();
}
