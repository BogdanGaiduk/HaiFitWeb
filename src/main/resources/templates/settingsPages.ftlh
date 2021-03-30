<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as mainParts>
<#import "parts/SettingsPage/additionToSettings.ftlh" as Addition_to_settings>

<html>

    <head>
        <meta charset="utf-8">
        <@mainParts.title></@mainParts.title>

        <link href="/static/css/settings.css" rel="stylesheet">
        <link href="/static/css/header.css" rel="stylesheet">
        <link href="/static/css/preloader.css" rel="stylesheet">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>

    <body>
        <@mainParts.preloader></@mainParts.preloader>
        <#--Adding a common header-->
        <@mainParts.header></@mainParts.header>

        <#--Container with left menu and center settings-->
        <div class="container  mt-2 "  >

            <div class="row">

                <#--left menu-->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-2">
                    <div id="list-example" class="list-group" style="border-radius: 10px;background-color: white">
                        <a class="list-group-item list-group-item-action" href="#User_information">Информация о пользователе</a>
                        <a class="list-group-item list-group-item-action" href="#Security">Безопасность</a>
                        <a class="list-group-item list-group-item-action" href="#Privacy">Приватность</a>
                        <a class="list-group-item list-group-item-action" href="#Notifications">Уведомления</a>
                        <a class="list-group-item list-group-item-action" href="#Black_list">Черный список</a>
                        <a class="list-group-item list-group-item-action" href="#Diary">Дневник</a>
                    </div>
                </div>

                <#--Center-->
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">

                    <div class="row ml-1 mr-1">

                        <div class="col-lg col-md col-sm col-xs div-center-settings " align="left">

                            <label><h4>Изменения настроек 🛠</h4></label>
                            <div role="separator" class="dropdown-divider mb-3"></div>

                             <#--User information section -->
                            <@Addition_to_settings.userInformation></@Addition_to_settings.userInformation>
                            <div class="mb-3" id="User_information" style="opacity: 0.7;" align="left">
                                <label>
                                    <h6 >Информация о пользователе
                                        <a href="#" data-toggle="modal" data-target="#Pop_up_user_information">
                                            &ensp;изменить
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                        </a>
                                    </h6>
                                </label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row mt-3 ml-2 mr-2" >
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>${User.name}</label>
                                    <label>${User.surname}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>${User.birthday}.${Month_of_birth}.${User.year_of_birth}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>${User.gender}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>${User.country}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <#--Security section -->
                            <@Addition_to_settings.securityInformation></@Addition_to_settings.securityInformation>
                            <@Addition_to_settings.verificationText></@Addition_to_settings.verificationText>
                            <div class="mb-3" id="Security" style="opacity: 0.7;" align="left">
                                <label>
                                    <h6 >Безопасность
                                        <a data-toggle="modal" class="text-primary" data-target="#pop_up_security">
                                            &ensp;изменить
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                        </a>
                                    </h6>
                                </label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3 pr-2" align="center">
                                    <input type="password" maxlength="25" size="10" name="password"
                                           value="******" style="Border: none; outline: none;" readonly>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 mb-3 pr-2" align="center">
                                    <label>${User.username}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 mb-3 pr-2" align="center" >
                                    <@Addition_to_settings.verificationUser></@Addition_to_settings.verificationUser>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <#--Privacy section-->
                            <div class="mb-3" id="Privacy" style="opacity: 0.7;" align="left">
                                <label><h6 >Приватность</h6></label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row  mb-3" >
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                    <div>
                                        <label>Моих друзей могут видеть</label>
                                    </div>
                                    <div>
                                        <label>Мои результаты могут видеть</label>
                                    </div>
                                    <div>
                                        <label>Мою информацию могут видеть</label>
                                    </div>
                                </div>
                                <div class="col-lg col-md col-sm col-xs">
                                    <div class="mb-3">
                                        <@Addition_to_settings.privacyPage></@Addition_to_settings.privacyPage>
                                    </div>
                                    <div class="mb-3">
                                        <@Addition_to_settings.privacyPage></@Addition_to_settings.privacyPage>
                                    </div>
                                    <div class="mb-3">
                                        <@Addition_to_settings.privacyPage></@Addition_to_settings.privacyPage>
                                    </div>
                                </div>
                            </div>

                            <#--Notification section-->
                            <div class="mb-3" id="Notifications" style="opacity: 0.7;" align="left">
                                <label><h6 >Уведомления</h6></label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row   mb-3" >
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                    <div class="btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-outline-success">
                                            <input name="my-input-value" type="checkbox" value="0" />
                                        </label>
                                        &ensp;Получать уведомления со звуком
                                    </div>
                                    <div class="btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-outline-success">
                                            <input name="my-input-value" type="checkbox" value="0" />
                                        </label>
                                        &ensp;Показать текст сообщения
                                    </div>
                                    <div class="btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-outline-success">
                                            <input name="my-input-value" type="checkbox" value="0" />
                                        </label>
                                        &ensp;Вкл/Выкл уведомления для сообщений
                                    </div>
                                    <div class="btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-outline-success">
                                            <input name="my-input-value" type="checkbox" value="0" />
                                        </label>
                                        &ensp;Вкл/Выкл уведомления о мероприятиях
                                    </div>
                                    <div class="btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-outline-success">
                                            <input name="my-input-value" type="checkbox" value="0" />
                                        </label>
                                        &ensp;Вкл/Выкл уведомления о добавления в друзья
                                    </div>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <#--Black list-->
                            <div class="mb-3" id="Black_list" style="opacity: 0.7;" align="left">
                                <label><h6 >Черный список</h6></label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row mb-3" >
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 mb-3" >
                                    <button type="button" class="btn bg-success text-white">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                                        </svg>
                                        Добавить пользователя
                                    </button>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <#--Diary section-->
                            <@Addition_to_settings.diaryInformation></@Addition_to_settings.diaryInformation>
                            <div class="mb-3" id="Diary" style="opacity: 0.7;" align="left">
                                <label>
                                    <h6>
                                        Дневник
                                        <a href="#" data-toggle="modal" data-target="#pop_up_for_diary">
                                            &ensp;изменить
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                            </svg>
                                        </a>
                                    </h6>
                                </label>
                                <div role="separator" class="dropdown-divider"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2" align="center">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>Вес: ${User.weight} кг</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2" align="center">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3" >
                                    <label>Рост: ${User.height} см</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2" align="center">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 mb-3" >
                                    <label>${coefficient}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>

                            <div class="form-row  ml-2 mr-2" align="center">
                                <div class="col-lg col-md col-sm col-xs"></div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mb-3" >
                                    <label>${target}</label>
                                </div>
                                <div class="col-lg col-md col-sm col-xs"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>