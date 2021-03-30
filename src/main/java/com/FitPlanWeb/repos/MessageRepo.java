package com.FitPlanWeb.repos;

import com.FitPlanWeb.domain.Message;
import com.FitPlanWeb.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    @Query(value = " FROM Message WHERE author=:user ORDER BY id DESC")
    List<Message> findByAuthor(@Param("user")User user);

    @Query(value = " FROM Message WHERE author.id=:user ORDER BY id DESC")
    List<Message> findByAuthorId(@Param("user")Integer id);

    @Query(value = " FROM Message WHERE author.id=:user ORDER BY id DESC")
    Message findById(@Param("user")Integer id);

    @Query(value = " FROM Message ORDER BY id DESC")
    List<Message> findAll();

    @Query(value = " FROM Message WHERE tag=:tag ORDER BY id DESC")
    List<Message> findByTag(@Param("tag") String tag);
}