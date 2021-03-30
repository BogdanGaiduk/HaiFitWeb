<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as c>
<html>
    <head>
        <meta charset="utf-8">
        <@c.title></@c.title>
        <link rel="stylesheet" href="/static/css/registration.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>

    <body>
        <#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

        <div class="head-navbar">
            <div class="container ">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "><@c.registration_header></@c.registration_header></div>
                </div>
            </div>
        </div>

        <#--Регистрация-->
        <div class="container mt-5">

            <div class="row">

                <div class="col-lg col-md col-sm col-xs " align="center">

                    <div class="d-inline p-2 center-registration"> Регистрация </div>

                    <div class=" row justify-content-center mb-3" >

                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 div-for-registration ">

                            <form action="/registration" method="post"  class="was-validated">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                <div style="text-align:center;margin-bottom:5px;">
                                    <span class="step"></span>
                                    <span class="step"></span>
                                    <span class="step"></span>
                                </div>

                                <div class="tab">

                                    <div class="form-row ">
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" name="name" id="Inputname" placeholder="Имя" required/>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" name="surname" id="Inputsurname" placeholder="Фамилия" required/>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <input type="Email" class="form-control" id="InputEmail"
                                               name="username" aria-describedby="emailHelp"
                                               required placeholder="E-mail"/>
                                    </div>

                                    <div class="form-group pb-1">
                                        <input type="password" class="form-control" id="InputPassword"
                                               placeholder="Пароль" name="password"
                                               required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" />
                                        <small id="emailHelp" class="form-text text-muted">
                                            Минимум 6 символов с минимум одной буквой от A-Z и a-z
                                        </small>
                                    </div>

                                    <div class="form-group mb-3  ">
                                        <select name="country" class="custom-select" required >
                                            <option value="">Cтрана...</option>
                                            <#list country as a>
                                                <option value="${a}" id="country">${a}</option>
                                            </#list>
                                        </select>
                                    </div>

                                    <div align="left">
                                        <small class="form-text text-muted">
                                            Дата рождения
                                        </small>
                                    </div>

                                    <div class="form-group mb-3 ml-2">

                                        <div class="form-check-inline col-sm-3 ">
                                            <select name="birthday" class="custom-select" required>
                                                <option value="">${for_day}</option>
                                                <#list 31..1 as i>
                                                    <option value="${i}" id="birthday">${i}</option>
                                                </#list>
                                            </select>
                                        </div>

                                        <div class="form-check-inline col-sm-3 ">
                                            <select name="month_of_birth" class="custom-select" required>
                                                <option value="">${for_month}</option>
                                                <option value="1">Январь</option>
                                                <option value="2">Февраль</option>
                                                <option value="3">Март</option>
                                                <option value="4">Апрель</option>
                                                <option value="5">Май</option>
                                                <option value="6">Июнь</option>
                                                <option value="7">Июль</option>
                                                <option value="8">Август</option>
                                                <option value="9">Сентябрь</option>
                                                <option value="10">Октябрь</option>
                                                <option value="11">Ноябрь</option>
                                                <option value="12">Декабрь</option>
                                            </select>
                                        </div>

                                        <div class="form-check-inline col-sm-4 ">
                                            <select name="year_of_birth" class="custom-select" required>
                                                <option value="" disabled>${for_year}</option>
                                                <#list 19..10 as i>
                                                    <option value="20${i}" id="year_of_birth" >20${i}</option>
                                                </#list>
                                                <#list 9..0 as i>
                                                    <option value="200${i}" id="year_of_birth" >200${i}</option>
                                                </#list>
                                                <#list 99..30 as i>
                                                    <option value="19${i}" id="year_of_birth" >19${i}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="custom-control custom-radio ml-3 mr-2 mb-3 " align="center">
                                        <div class="form-check-inline col-sm-4 " align="center">
                                            <input type="radio" class="custom-control-input" id="customControlValidation2" name="gender" value="Женский" required>
                                            <label class="custom-control-label" for="customControlValidation2">Женщина</label>
                                        </div>
                                        <div class="form-check-inline col-sm-4 " align="center">
                                            <input type="radio" class="custom-control-input" id="customControlValidation3" name="gender" value="Мужской" required>
                                            <label class="custom-control-label" for="customControlValidation3">Мужчина</label>
                                        </div>
                                    </div>

                                    <div style="overflow:auto;">
                                        <div style="float:right;">
                                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                                            <button type="button" id="nextBtn" onclick="nextPrev(1)">
                                                Продолжить <img class="icon-excel" >
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab">
                                    <div class="form-row ">

                                        <div class="form-group col-md-6 mb-3">
                                            <select name="height" class="custom-select" required>
                                                <option value="">Рост (см)</option>
                                                <#list 120..220 as i>
                                                    <option value="${i}">${i}</option>
                                                </#list>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6 mb-3">
                                            <select name="weight" class="custom-select" required>
                                                <option value="">Вес (кг)</option>
                                                <#list 20..220 as i>
                                                    <option value="${i}">${i}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <select name="coefficient" class="custom-select" required>
                                            <option value="">Активность...</option>
                                            <option value="1.2">Сидячая работа</option>
                                            <option value="1.375">Легкие упражнения (1-2 раза в неделю)</option>
                                            <option value="1.462">Легкие упражнения (4-5 раз в неделю)</option>
                                            <option value="1.550">Интенсивные тренировки</option>
                                            <option value="1.637">Ежедневные тренировки</option>
                                            <option value="1.725">Ежедневные интенсивные тренировки</option>
                                            <option value="1.9">Интенсивные тренировки 2 раза в день</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <select name="target" class="custom-select" required>
                                            <option value="">Цель...</option>
                                            <option value="1">Поддержание веса</option>
                                            <option value="2">Похудение</option>
                                            <option value="3">Набор веса</option>
                                        </select>
                                    </div>

                                    <div style="overflow:auto;">
                                        <div style="float:right;">
                                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Вернуться</button>
                                            <button type="button" id="nextBtn" onclick="nextPrev(1)">Продолжить</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab">

                                    <div class="form-row mt-5 mb-5">
                                        <div class="col-md-4 mb-3 nocopy">
                                            <span class="text-for-check">${random}</span>
                                        </div>
                                        <div class="col-md-8 mb-3">
                                            <input type="text" size="30" class="form-control"  pattern="${random}"
                                                   placeholder="Введите число с картинки" required>
                                        </div>
                                    </div>

                                    <div style="overflow:auto;">
                                        <div style="float:right;">
                                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">❮❮❮ Вернуться</button>
                                            <button type="submit" >Начать😌</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="static/JS/forRegistration.js"></script>
    </body>
</html>