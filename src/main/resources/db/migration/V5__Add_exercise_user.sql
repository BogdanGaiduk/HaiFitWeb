create table exercise_user (
    id INT not null ,
    exercise varchar(255) not null ,
    calories INT not null ,
    date varchar(255) not null ,
    user_id INT ,
    link varchar(255) not null ,
    primary key (id)
)