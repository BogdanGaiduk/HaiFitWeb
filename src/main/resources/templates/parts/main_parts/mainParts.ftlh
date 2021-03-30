
<#macro header>
<#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <!--Select2-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
    <div class=" head-navbar sticky-top " >
        <div class="container">
            <div class="row">
                <div class="col-lg col-md col-sm col-xs head-navbar">
                    <nav class="navbar navbar-expand-lg navbar-light ">
                        <a class="navbar-brand head-navbar-logo " href="/">
                            <img src="/static/images/Logo_for_login_page.png" width="140" height="40">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <form method="get" action="/search">
                                <input class="for-search-input" type="text" name="search" value="${filter?if_exists}" placeholder="Поиск...">
                                <button type="submit" style="background-color: #1D4354;border: #1D4354 solid 1px;color: white;">
<#--                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">-->
<#--                                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>-->
<#--                                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>-->
<#--                                    </svg>-->
                                </button>
                            </form>
                            <ul class="navbar-nav pr-0">
                                <li class="nav-item">
                                    <a class="nav-link" align="center" href="/main">
                                        <img src="/static/images/Header/home.png" width="25" height="25">
                                        <label style="font-size: small" class="text-white">Главная</label>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" align="center" href="#">
                                        <img src="/static/images/Header/Friends.png" width="25" height="25">
                                        <label style="font-size: small"  class="text-white">Друзья</label>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" align="center" href="#">
                                        <img src="/static/images/Header/Message1.png" width="25" height="25">
                                        <label style="font-size: small"  class="text-white">Cообщения</label>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" align="center" href="#">
                                        <img src="/static/images/Header/Music.png" width="25" height="25">
                                        <label style="font-size: small"  class="text-white">FIT MUSIC</label>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" align="center" href="#">
                                        <img src="/static/images/Header/Notification1.png" width="25" height="25">
                                        <label style="font-size: small" class="text-white">Уведомления</label>
                                    </a>
                                </li>
                                <li class="nav-item dropdown mt-2" align="center" >
                                    <a href="/user_page">
                                        <#if User.filename??>
                                                <img src="/img/${User.filename}" style="border-radius: 100px" height="25" width="25"/>
                                        <#else>
                                            <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="25" width="25"/>
                                        </#if>
                                    </a>
                                    <a class="nav-link dropdown-toggle pt-0" align="center" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <label style="font-size: small"  class="text-white">${User.name}</label>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="/user/profile">Настройки аккаунта</a>
                                        <a class="dropdown-item" href="/admin">Инструменты админ. </a>
                                        <form action="/logout" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input type="submit" class="dropdown-item" value="Выйти"/>
                                        </form>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-primary pr-5" href="/diary" >
                                        <button type="submit" class=" head-button-my-profile">
                                            <strong>Дневник</strong>
                                            <#--                            <img src="/static/images/main_page/Main_elements/diary.png" alt="Выбрать файл" height="25" width="30">-->
                                        </button>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro textActiveted>
    <#if User.code!="activated">
        <@activated.verificationText></@activated.verificationText>
        <div class="container ">
            <div class="row">
                <div class="col-xl col-lg col-md col-sm col-xs" align="center">
                    <a class="text-muted" >Ваша страница не верефицирована.</a>
                    <a class="text-success" data-toggle="modal"data-target="#pop_up_security_1"> Изменить?</a>
                </div>
            </div>
        </div>
    </#if>
</#macro>

<#macro registration_header>
    <nav class="navbar head-navbar">
        <a class="nav-link text-primary " href="/login">
            <img src="/static/images/Logo_for_login_page.png" width="140" height="40">
        </a>
    </nav>
</#macro>

<#macro title>
    <title>HaiFit</title>
    <link rel="shortcut icon" href="images/A_Logo/Logo_for_login.png"  type="image/x-icon">
</#macro>

<#macro preloader>
    <div class="preloader">
        <svg class="preloader__image" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
            <path fill="currentColor"
                  d="M304 48c0 26.51-21.49 48-48 48s-48-21.49-48-48 21.49-48 48-48 48 21.49 48 48zm-48 368c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zm208-208c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zM96 256c0-26.51-21.49-48-48-48S0 229.49 0 256s21.49 48 48 48 48-21.49 48-48zm12.922 99.078c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.491-48-48-48zm294.156 0c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.49-48-48-48zM108.922 60.922c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.491-48-48-48z">
            </path>
        </svg>
    </div>
    <script>
        window.onload = function () {
            document.body.classList.add('loaded_hiding');
            window.setTimeout(function () {
                document.body.classList.add('loaded');
                document.body.classList.remove('loaded_hiding');
            }, 500);
        }
    </script>
</#macro>

<#macro test>
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
    </svg>
</#macro >

