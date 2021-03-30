package com.FitPlanWeb.additional;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

@Component
public class Datess {

    //Для постов
    public String TimeNowForMain(Date time1) {
        SimpleDateFormat format1;
        format1 = new SimpleDateFormat(
                "HH:mm");
        String timeee = format1.format(time1);
        return timeee;
    }

    public  String DayAndMonthNowForMain(Calendar date1) {
        //Для даты сегодняшнего дня
        int day = date1.get(Calendar.DAY_OF_MONTH);//День
        int month = date1.get(Calendar.MONTH);//Месяц
        String[] mon = {"Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля",
                "Августа", "Сентября", "Октября", "Ноября", "Декабря"};
        String dateee = (String.valueOf(day) + " " + mon[month] + " ");
        return dateee;
    }


    //Для регистрации
    public  String DayNowForRegistration(Calendar day) {
        int d = day.get(Calendar.DAY_OF_MONTH);
        String dayNow = String.valueOf(d);
        return dayNow;
    }
    public  String MonthNowForRegistration(Calendar month) {
        int d = month.get(Calendar.MONTH);
        String[] monthNow = {"Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля",
                "Августа", "Сентября", "Октября", "Ноября", "Декабря"};
        return monthNow[d];
    }
    public  String YearNowForRegistration(Calendar year) {
        int d = year.get(Calendar.YEAR);
        String yearNow = String.valueOf(d);
        return yearNow;
    }


    //Для дневника
    public  String DayAndMonthAndYearForDiary(int x) {
        //Для даты сегодняшнего дня
        LocalDate date = LocalDate.now();
        date = date.minusDays(x);
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String day = String.valueOf(date.format(format));
        return day;
    }
    public  String DayOfWeekForDiary(String dateDiary) {
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate localDate = LocalDate.parse(dateDiary,format);
        String day =  String.valueOf(localDate.getDayOfWeek());
        if (day.equals("MONDAY")){
            day="ПН";
        }
        if (day.equals("TUESDAY")){
            day="ВТ";
        }
        if (day.equals("WEDNESDAY")){
            day="СР";
        }
        if (day.equals("THURSDAY")){
            day="ЧТ";
        }
        if (day.equals("FRIDAY")){
            day="ПТ";
        }
        if (day.equals("SATURDAY")){
            day="СБ";
        }
        if (day.equals("SUNDAY")){
            day="ВС";
        }
        return day;
    }
}