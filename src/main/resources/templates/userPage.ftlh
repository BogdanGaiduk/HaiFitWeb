<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as mainParts>
<#import "parts/SettingsPage/additionToSettings.ftlh" as activated>
<#import "parts/UserPage/subscribersAndSubscriptions.ftlh" as SubscribersAndSubscriptions>

<html>

    <head>

        <meta charset="utf-8">
        <@mainParts.title></@mainParts.title>

        <link href="/static/css/main.css" rel="stylesheet">
        <link href="/static/css/header.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!-- fancyBox3 CSS -->
        <link href="static/fancybox-master/dist/jquery.fancybox.css" rel="stylesheet">
    </head>

    <body>
        <#--Adding a common header-->
        <@mainParts.header></@mainParts.header>
        <@activated.verificationText></@activated.verificationText>

        <#--Container with user information and fit-lenta-->
        <div class="container  mt-3" >

            <div class="row">

                <div class="col-lg col-md col-sm col-xs "></div>

                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

                    <div  class="for-main-block-elements">
                        <div class="row">

                            <div class="col-lg col-md col-sm col-xs" align="left">
                                <#if User.filename??>
                                    <a data-fancybox="gallery" href="/img/${User.filename}">
                                        <img src="/img/${User.filename}" style="border-radius: 100px" width="150" height="150"/>
                                    </a>
                                <#else>
                                    <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" width="150" height="150"/>
                                </#if>
                            </div>

                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" align="left">
                                <h5 class="mt-0 mb-1">${User.name} ${User.surname}</h5>
                                <#if User.username!="HaiFit@haifit.com">
                                    <small id="emailHelp" class="form-text text-muted">${User.country}</small>
                                <#else>Official page ✔️
                                </#if>
                                <div class="row mt-3"  align="left">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mt-1" >
                                        <button type="button" class="btn btn-light" style="border-radius: 10px" data-toggle="modal"  data-target="#subscribers">
                                            Подписчиков ${subscribersCount}
                                        </button>
                                        <#--                                            <a href="/user_page/subscribers/user_id:${User.id}/list">Подписчиков ${subscribersCount}</a>-->
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mt-1" >
                                        <button type="button" class="btn btn-light " style="border-radius: 10px" data-toggle="modal"  data-target="#subscriptions">
                                                    Подписок ${subscriptionsCount}
                                        </button>
                                    </div>
                                    <div class="col-lg col-md col-sm col-xs"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg col-md col-sm col-xs "></div>
            </div>

            <div class="row">

                <div class="col-lg col-md col-sm col-xs "></div>

                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

                    <form method="post" action="/user_page/add_post" enctype="multipart/form-data"><#--добавили enctype="multipart/form-data" для вывода файла на сервер-->
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />

                        <div class="div-block-add-post pr-2 pl-2" align="left">

                            <li class="media">
                                <#if User.filename??>
                                    <img src="/img/${User.filename}" style="border-radius: 100px" height="45" width="50"/>
                                <#else>
                                    <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50"/>
                                </#if>
                                <div class="media-body ml-2">
                                    <textarea name="text" class="text-area-add-post"
                                              rows="1" cols="70" placeholder="   Fit-нуть что-то 🏋️"‍></textarea>
                                </div>
                            </li>

                            <div class="row ">

                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                    <input name="file" type="file" name="file" id="input__file" class="input input-file" multiple>
                                    <label for="input__file" class="button-for-div-file">
                                        <span ><img src="/static/images/MainElements/Photo.png" alt="Выбрать файл" width="30"></span>
                                        <span >Фото</span>
                                    </label>
                                </div>

                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                    <input name="file" type="file" name="file" id="input__file" class="input input-file" multiple>
                                    <label for="input__file" class="button-for-div-file">
                                        <span ><img src="/static/images/MainElements/Video.png" alt="Выбрать файл" width="38"></span>
                                        <span >Видио</span>
                                    </label>
                                </div>

                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                    <input type="text" name="tag" class="button-for-div-file" style="border: 0px" placeholder="Тэг"/>
                                </div>
                            </div>
                        </div>

                        <div align="right">
                            <button type="submit" class="button-send-a-post">Опубликовать</button>
                        </div>
                    </form>

                    <div>
                        <#list messages as messages>

                            <div class="for-main-block-elements" align="left">

                                <label>
                                    <#if messages.avatar??>
                                        <a data-fancybox="gallery" href="/img/${messages.avatar}">
                                            <img src="/img/${messages.avatar}" style="border-radius: 100px" height="45" width="50"/>
                                        </a>
                                    <#else>
                                        <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                    </#if>
                                    <strong>${messages.authorName}</strong>
                                    <small class="form-text text-muted">${messages.date}  в ${messages.time}</small>
                                </label>

                                <div class="row">
                                    <div class=" col-lg col-md col-sm col-xs">
                                        <label style=" word-wrap: break-word; width: 100%">${messages.text}</label>
                                        <#if messages.tag == "">
                                        <#else>
                                            <p><a href="/search?search=${messages.tag}&filterByFitLenta=true"><i>#${messages.tag}</i></a> </p>
                                        </#if>
                                        <#if messages.filename??>
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg col-md col-sm col-xs ">
                                                        <a data-fancybox="gallery" href="/img/${messages.filename}">
                                                            <img src="/img/${messages.filename}" width="260" height="210"/>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        <#else >
                            No message
                        </#list>
                    </div>
                </div>

                <div class="col-lg col-md col-sm col-xs "></div>
            </div>
        </div>

        <script src="static/fancybox-master/dist/jquery.fancybox.js"></script>
        <@SubscribersAndSubscriptions.subscribers></@SubscribersAndSubscriptions.subscribers>
        <@SubscribersAndSubscriptions.Subscriptions></@SubscribersAndSubscriptions.Subscriptions>
    </body>
</html>
