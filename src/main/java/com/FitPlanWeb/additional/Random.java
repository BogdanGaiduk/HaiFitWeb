package com.FitPlanWeb.additional;

import org.springframework.stereotype.Component;

@Component
public class Random {

    public String random() {
        String[] letters={" ","Q","q","W","w","E","e","R","r","T","t","Y","y","U","u","I","i",
                "O","o","P","p","A","a","S","s","D","d","F","f","G","g","H","h","J","j",
                "K","k","L","l","Z","z","X","x","C","calendar","V","v","B","b","N","n","M","m"};
        int first_letter = 1+(int)(Math.random()*(letters.length-1));
        int second_letter = 1+(int)(Math.random()*(letters.length-1));
        int number = 1235+(int)(Math.random()*9999);//рандомное число
        String random =letters[first_letter]+String.valueOf(number)+letters[second_letter];
        return random;
    }
}