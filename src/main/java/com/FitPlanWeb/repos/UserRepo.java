package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findById(Integer id);
    User findByCodeUpdatePassword(String code);
    User findByUsername(String username);
    List<User>findByNameOrSurname(String name,String surname);
    List<User>findByNameAndSurname(String name,String surname);
    User findAllByUsername(User user);
    User findByCode(String code);
}
