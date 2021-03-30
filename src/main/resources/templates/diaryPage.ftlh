<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->
<#import "parts/main_parts/mainParts.ftlh" as mainParts>
<#import "parts/DiaryPage/popUpForDiaryPage.ftlh" as popUpForDiaryPage>
<#import "parts/DiaryPage/PartsMeals/diaryBreakfast.ftlh" as breakfast>
<#import "parts/DiaryPage/PartsMeals/diaryDinner.ftlh" as dinner>
<#import "parts/DiaryPage/PartsMeals/diaryEveningDinner.ftlh" as eveningDinner>
<#import "parts/DiaryPage/PartsMeals/diarySnack.ftlh" as snack>

<html>

    <head>
        <meta charset="utf-8">
        <@mainParts.title></@mainParts.title>
        <link href="/css/diary.css" rel="stylesheet">
        <link href="/css/header.css" rel="stylesheet">
        <link href="/css/preloader.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>

    <body>
        <#--Adding  loader-->
        <@mainParts.preloader></@mainParts.preloader>
        <#--Adding a common header-->
        <@mainParts.header></@mainParts.header>

        <#--Weight change question text-->
        <div class="container  mt-1 " align="center" >
            <div class="row">
                <div class="col-lg col-md col-sm col-xs"></div>
                <div class="col-lg col-md col-sm col-xs" style="font-family: 'Open Sans', sans-serif;
                                               font-size: 14px;font-style: normal;
                                               font-weight: 700;line-height: 19px;
                                               letter-spacing: 0em; text-align: center;">
                    <a href="http://localhost:8080/user/profile#item-6" style="color: green" >
                        Желаете изменить</a> свои данные ?
                </div>
                <div class="col-lg col-md col-sm col-xs"></div>
            </div>
        </div>

        <#--Container with diary menu center buttons-->
        <div class="container  mt-2 mb-2" align="center" >
            <div class="row ">

                <div class="col-lg col-md col-sm col-xs"></div>

                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">

                    <button type="button" class="btn mr-3" style="background-color: white; border-radius: 15px"  data-toggle="modal" data-target="#e">
                        <div class="media">
                            <div style="position: relative; width: 100%;height: 40px">
                                <img src="/static/images/DiaryPage/calendar.png" alt="" height="40" width="42"/>
                                <label style="position	: absolute; top: 13px;
                                            left:12px; size: 12px;">${dayOfWeekNow}</label>
                            </div>
                            <div class="media-body">
                                <small class="form-text text-muted">
                                    ${dateModel}
                                </small>
                            </div>
                        </div>
                    </button>

                    <button type="button" class="btn btn-warning mr-3" style="border-radius: 15px" data-toggle="modal" data-target="#staticBackdrop">
                        <label style="height: 32px">Расчитать КБЖУ🔥</label>
                    </button>

                    <button type="button" class="btn" style="background-color: white; border-radius: 15px">
                        <div class="media">
                            <div style="position: relative; width: 100%;height: 40px">
                                <img class="input__file-icon" src="/static/images/DiaryPage/libra.png" alt="Выбрать файл" height="40" width="42">
                            </div>
                            <div class="media-body">
                                <small class="form-text text-muted">
                                    Вес:${weight}кг
                                </small>
                            </div>
                        </div>
                    </button>
                </div>

                <div class="col-lg col-md col-sm col-xs"></div>
            </div>
        </div>

        <#--Left right and center menu container-->
        <div class="container  mt-1">

            <div class="row ">
                <#--Left menu-->
                <div class="col-lg col-md col-sm col-xs" >

                    <div class=" mt-2 pb-2 " style="background-color: white; border-radius: 10px" align="center">
                        <div style="background-color: white; border:5px ;border-radius: 10px">
                            <label style="font-family: 'Open Sans', sans-serif;
                                                      font-style: normal;
                                                      font-weight: bold;
                                                      font-size: 20px;width: 100%">
                                Активность
                            </label>
                            <small class="text-muted">на ${dateModel}</small>
                            <hr class="color-hr">
                            <#list activity as activity>
                                <p class="ml-2" align="left"><img src="../static/images/DiaryPage/runs.png" width="20"><a class="text-success" href="${activity.link}"> ${activity.exercise}</a>
                                    (${activity.calories} ккал)</p>
                            </#list>
                        </div>

                        <div>
                            <label class="color-text-green">
                                <#if sumActivity??>
                                    Ваша активность сегодня: ${sumActivity} ккал
                                <#else>Сегодня не было активностей
                                </#if>
                            </label>
                        </div>

                        <div class="mr-1 ml-1">
                            <button type="button" class="button-left-menu mt-2" data-toggle="modal" data-target="#addMyExercise">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                                <strong> Добавить  </strong>
                            </button>
                        </div>
                    </div>

                    <button type="button" class="button-left-menu mt-2" data-toggle="modal" data-target="#addProductHaiFit">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                        <strong> Добавить продукт </strong>
                    </button>
                </div>

                <#--Center menu-->
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                    <div  align="center">
                        <@breakfast.page></@breakfast.page>
                        <@dinner.page></@dinner.page>
                        <@eveningDinner.page></@eveningDinner.page>
                        <@snack.page></@snack.page>
                    </div>
                </div>

                <#--Right menu-->
                <div class="col-lg col-md col-sm col-xs" >
                    <div class=" mb-2 pb-2 " style="background-color: #1D4354; border-radius: 10px" align="center">

                        <#--Header target-->
                        <div style="background-color: white; border:5px ;border-radius: 10px">
                            <label style="font-family: 'Open Sans', sans-serif;
                                                          font-style: normal;
                                                          font-weight: bold;
                                                          font-size: 20px;width: 100%">
                                Цель
                            </label>
                            <small class="text-muted">на ${dateModel}</small>
                        </div>

                        <#--Statistics and target calories-->
                        <div class="mt-3 mr-3 ml-3">
                            <div>
                                <label style="font-weight: bold;color: white;font-size: small">${sumCalories}/${targetCalories} ккал ${percentForCalories}%</label>
                                <div class="progress " style="height: 20px" align="center">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: ${percentForCalories}%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" ></div>
                                </div>
                            </div>
                        </div>

                        <#--Statistics PFC(БЖУ)-->
                        <div class="mt-3 " style="border-top: #F4F4F4 solid 1px;">
                            <div class="progress mt-3 mr-1 ml-1 mb-2" style="height: 20px;border-radius: 10px">
                                <div class="progress-bar " role="progressbar" style="width: ${percentProtein}%;background-color: #00FFD1;color: black" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">
                                    ${percentProtein}%
                                </div>
                                <div class="progress-bar" role="progressbar" style="width: ${percentFat}%;background-color: #D9008F; color: black" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
                                    ${percentFat}%
                                </div>
                                <div class="progress-bar bg-success" role="progressbar" style="width: ${percentCarbohydrates}%; color: black" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                    ${percentCarbohydrates}%
                                </div>
                            </div>
                        </div>

                        <#--Protein-->
                        <div class="row mr-1 ml-1" align="left" >
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                <label style="color: white; font-size: 15px">Белки</label>
                            </div>
                            <div class="col-lg col-md col-sm col-xs">
                                <div class="progress">
                                    <div class="progress-bar " role="progressbar" style="width: 100%; background-color: #00FFD1" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                        <small style="color: black">${sumProtein} гр</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <#--Fat-->
                        <div class="row mr-1 ml-1" align="left">
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                <label style="color: white; font-size: 15px">Жиры</label>
                            </div>
                            <div class="col-lg col-md col-sm col-xs">
                                <div class="progress">
                                    <div class="progress-bar " role="progressbar" style="width: 100%; background-color: #D9008F" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                        <small style="color: black">${sumFat} гр</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <#--Carbohydrates-->
                        <div class="row mr-1 ml-1" align="left">
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                <label style="color: white; font-size: 15px">Углеводы</label>
                            </div>
                            <div class="col-lg col-md col-sm col-xs">
                                <div class="progress">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                        <small style="color: black">${sumCarbohydrates} гр</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <#--Micronutrient statistics-->
                        <div  class="mt-2" align="left" style="border-top: #F4F4F4 solid 1px; color: white; font-size: 12px">
                            <div class="mt-2 pl-3">
                                <label style="padding-right: 5%">Сахар: ${sumSugar} гр</label>
                                <label >Натрий: ${sumSodium} мг</label>
                                <label style="width: 100%">Клетчатка: ${sumCellulose} гр</label>
                                <label >Калий: ${sumPotassium} мг</label>
                                <label style="width: 100%">Трансжиры: ${sumTransFat} гр</label>
                                <label>Насыщенные жиры: ${sumSaturatedFat} гр</label>
                            </div>
                        </div>

                        <#--Button to change target-->
                        <div style="border-top: #F4F4F4 solid 1px">
                            <a href="http://localhost:8080/user/profile#item-6">
                                <button type="button" class="btn" style="     font-family: 'Open Sans', sans-serif;
                                                                font-style: normal;
                                                                /*font-weight: bold;*/
                                                                font-size: 20px;
                                                                color: #F4F4F4">
                                                Изменить цель
                                </button>
                            </a>
                        </div>
                    </div>

                    <#--Text sentence HaiFit-->
                    <div align="center">
                        <label style=" font-family: 'Open Sans', sans-serif;
                                                    font-size: 14px;font-style: normal;
                                                    font-weight: 700;line-height: 19px;
                                                    letter-spacing: 0em; text-align: center;">
                            Не справляетесь с поставленными целями?
                            <a href="#" style="color: green">HaiFit</a> предлагает вам найти тренера подходящего под ваши требования
                        </label>
                        <button type="button" style="border-radius: 20px; border: 1px solid #1D4354;
                                                                 font-family: 'Open Sans', sans-serif;
                                                                 font-weight: bold;font-size: 20px;
                                                                 text-align: center; color: #1D4354;background-color: #F4F4F4">
                            Найти тренера
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script src="static/JS/forDiary.js"></script>
        <@popUpForDiaryPage.addExerciseForTheUser></@popUpForDiaryPage.addExerciseForTheUser>
        <@popUpForDiaryPage.addProductInHaiFit></@popUpForDiaryPage.addProductInHaiFit>
        <@popUpForDiaryPage.calendar></@popUpForDiaryPage.calendar>
        <@popUpForDiaryPage.calculator></@popUpForDiaryPage.calculator>

    </body>

</html>