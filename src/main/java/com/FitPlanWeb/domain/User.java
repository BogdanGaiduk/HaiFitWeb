package com.FitPlanWeb.domain;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
@Entity
@Table(name = "usr")
public class User  implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id ;
    private String name;
    private String surname;
    private String username;//e-mail
    private String code;
    private String password;
    private String country;
    private String year_of_birth;
    private String birthday;
    private String month_of_birth;
    private Double weight;
    private Double height;
    private String gender;
    private Double coefficient;
    private String target;
    private boolean active;
    private String filename;
    private String codeUpdatePassword;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role>roles;

    //для подписчиков
    @ManyToMany
    @JoinTable(
            name = "user_subscriptions",
            joinColumns = { @JoinColumn(name = "channel_id") },
            inverseJoinColumns = { @JoinColumn(name = "subscriber_id") }
    )
    private Set<User> subscribers = new HashSet<>();//список подписчиков

    //для подписок
    @ManyToMany
    @JoinTable(
            name = "user_subscriptions",
            joinColumns = { @JoinColumn(name = "subscriber_id") },
            inverseJoinColumns = { @JoinColumn(name = "channel_id") }
    )
    private Set<User> subscriptions = new HashSet<>();//список подписок



    //методы интерфейса UserDetails
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @Override
    public boolean isEnabled() {
        return isActive();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    public String getName() { return name; }
    public void setName(String name) {
        this.name = name;
    }


    public String getSurname() { return surname; }
    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }


    public void setUsername(String username) {
        this.username = username;
    }
    public String getUsername() {
        return username;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }


    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    //Год, месяц и день рождения
    public String getYear_of_birth() {
        return year_of_birth;
    }
    public String setYear_of_birth(String test_age ) { this.year_of_birth = test_age;
        return year_of_birth;}

    public String getBirthday() { return birthday; }
    public void setBirthday(String birthday) { this.birthday = birthday; }

    public String getMonth_of_birth() { return month_of_birth; }
    public void setMonth_of_birth(String month_of_birth) { this.month_of_birth = month_of_birth; }

    public Double getWeight() { return weight; }

    public void setWeight(Double weight) { this.weight = weight; }

    public Double getHeight() { return height; }

    public void setHeight(Double height) { this.height = height; }

    public String getGender() { return gender; }

    public void setGender(String gender) { this.gender = gender; }

    public Double getCoefficient() { return coefficient; }

    public void setCoefficient(Double coefficient) { this.coefficient = coefficient; }

    public String getTarget() { return target; }

    public void setTarget(String target) { this.target = target; }

    //Роли
    public Set<Role> getRoles() {
        return roles;
    }
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Set<User> getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(Set<User> subscribers) {
        this.subscribers = subscribers;
    }

    public Set<User> getSubscriptions() {
        return subscriptions;
    }

    public void setSubscriptions(Set<User> subscriptions) {
        this.subscriptions = subscriptions;
    }

    public String getCodeUpdatePassword() {
        return codeUpdatePassword;
    }

    public void setCodeUpdatePassword(String codeUpdatePassword) {
        this.codeUpdatePassword = codeUpdatePassword;
    }
}