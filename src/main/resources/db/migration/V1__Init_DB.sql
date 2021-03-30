create sequence hibernate_sequence start 1 increment 1;
--    create sequence hibernate_sequence start 1 increment 1;

    create table diary_breakfast (
        id INT not null,
        calories INT ,
        carbohydrates FLOAT ,
        date varchar(255),fat FLOAT ,
        product_name varchar(255),
        product_weight INT,
        protein FLOAT ,
        user_id INT ,
        sugar FLOAT ,
        cellulose FLOAT,
        sodium FLOAT,
        trans_fat FLOAT,
        potassium FLOAT,
        saturated_fat FLOAT,
        primary key (id)
    );

    create table diary_dinner (
        id INT not null,
        calories INT ,
        carbohydrates FLOAT ,
        date varchar(255),fat FLOAT ,
        product_name varchar(255),
        product_weight INT,
        protein FLOAT ,
        user_id INT ,
        sugar FLOAT ,
        cellulose FLOAT,
        sodium FLOAT,
        trans_fat FLOAT,
        potassium FLOAT,
        saturated_fat FLOAT,
        primary key (id)
    );

    create table diary_evening (
        id INT not null,
        calories INT ,
        carbohydrates FLOAT ,
        date varchar(255),fat FLOAT ,
        product_name varchar(255),
        product_weight INT,
        protein FLOAT ,
        user_id INT ,
        sugar FLOAT ,
        cellulose FLOAT,
        sodium FLOAT,
        trans_fat FLOAT,
        potassium FLOAT,
        saturated_fat FLOAT,
        primary key (id)
    );

    create table diary_snack (
        id INT not null,
        calories INT ,
        carbohydrates FLOAT ,
        date varchar(255),fat FLOAT ,
        product_name varchar(255),
        product_weight INT,
        protein FLOAT ,
        user_id INT ,
        sugar FLOAT ,
        cellulose FLOAT,
        sodium FLOAT,
        trans_fat FLOAT,
        potassium FLOAT,
        saturated_fat FLOAT,
        primary key (id)
    );

    create table message(
        id INT not null ,
        date varchar(255),
        filename varchar(255),
        month varchar(255),
        tag varchar(255),
        text varchar(2000),
        time varchar(255),
        user_id INT,
        primary key (id)
    );

    create table products (
        id INT not null ,
        calories INT not null ,
        carbohydrates FLOAT not null,
        fat FLOAT not null ,
        manufacturer varchar(255),
        protein FLOAT not null ,
        sugar FLOAT not null,
        the_products_name varchar(255),
        filename varchar(255),
        cellulose FLOAT ,
        sodium FLOAT,
        trans_fat FLOAT,
        potassium FLOAT,
        saturated_fat FLOAT,
        primary key (id)
    );

    create table user_role (
        user_id INT not null ,
        roles varchar(255)
    );

    create table usr (
        id INT not null ,
        active boolean not null,
        birthday varchar(255),
        code varchar(255),
        coefficient FLOAT ,
        country varchar(255),
        height FLOAT,
        month_of_birth varchar(255),
        name varchar(255),
        password varchar(255) not null,
        gender varchar(255),
        surname varchar(255),
        target varchar(255),
        username varchar(255) not null,
        weight FLOAT,
        year_of_birth varchar(255),
        filename varchar(255),
        primary key (id)
    );



alter table if exists diary_breakfast
    add constraint diary_breakfast_fk
    foreign key (user_id) references usr;

alter table if exists diary_dinner
    add constraint diary_dinner_fk
    foreign key (user_id) references usr;

alter table if exists diary_evening
    add constraint diary_evening_fk
    foreign key (user_id) references usr;

alter table if exists diary_snack
    add constraint diary_snack_fk
    foreign key (user_id) references usr;

alter table if exists message_user
    add constraint message_user_fk
    foreign key (user_id) references usr;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;
