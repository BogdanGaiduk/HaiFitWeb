<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as mainParts>
<#import "parts/SettingsPage/additionToSettings.ftlh" as activated>
<#import "parts/main_parts/editFitFace.ftlh" as editFitFace>
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
        <#--Adding verification text -->
        <@mainParts.textActiveted></@mainParts.textActiveted>

        <#--Container with left and right menus and  fit-lenta-->
        <div class="container mt-3"  >
            <div class="row">

                <#--left menu -->
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3 " >
                    <div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 for-main-block-elements">
                        <#if User.filename??>
                            <a data-fancybox="gallery" href="/img/${User.filename}">
                                <img src="/img/${User.filename}" style="border-radius: 100px" width="150" height="150"/>
                            </a>
                            <#else>
                                <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" width="150" height="150"/>
                        </#if>
                        <h5 class="mt-0 mb-1">${User.name} ${User.surname}</h5>
                        <small class="form-text text-muted">${User.country}</small>
                       <button class="btn btn-white" data-toggle="modal" data-target="#FitFace">
                                <span ><img src="/static/images/MainElements/downloads.png" alt="Выбрать файл" width="30"></span>
                                <span >FitFace</span>
                       </button>
                        <@editFitFace.page></@editFitFace.page>
                        <button class="btn btn-white mt-0">
                            <span ><img src="/static/images/MainElements/recipes.png" alt="Выбрать файл" width="30"></span>
                            <span >Рецепты</span>
                        </button>
                    </div>
                </div>

                <#--fit-lenta-->
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <#--block for adding posts-->
                        <div  >
                            <form method="post" action="/main/add" enctype="multipart/form-data">
                                <#--добавили enctype="multipart/form-data" для вывода файла на сервер-->
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
                                            <input name="file" type="file" id="input__file" class="input input-file" multiple>
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
                        </div>
                        <#--block with all posts-->
                        <div>
                            <#list messages as messages>
                                <#--post block in a loop-->
                                <div class="for-main-block-elements" align="left">

                                    <#--Photo, name and surname of the author and time of sending -->
                                    <label>
                                        <#if messages.avatar??>
                                            <a data-fancybox="gallery" href="/img/${messages.avatar}">
                                                <img src="/img/${messages.avatar}" style="border-radius: 100px" height="45" width="50"/>
                                            </a>
                                        <#else>
                                            <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                        </#if>
                                        <a href="user_page/id:${messages.idAuthor}" class="text-dark"><strong>${messages.authorName}</strong></a>
                                        <small class="form-text text-muted">${messages.date}  в ${messages.time}</small>
                                    </label>

                                    <#--Post content (text, file and tag)-->
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

                <#--right menu-->
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="for-main-block-elements" align="left">
                        <h5 class="mt-0 mb-1">Подписки</h5>
                        <#list users as user>
                            <li class="media mt-1">
                                <#if user.filename??>
                                    <a data-fancybox="gallery" href="/img/${user.filename}">
                                        <img src="/img/${user.filename}" style="border-radius: 100px" height="45" width="50"/>
                                    </a>
                                <#else>
                                    <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                </#if>
                                <div class="media-body pl-2">
                                    <a href="user_page/id:${user.id}">${user.name} ${user.surname}</a>
                                </div>
                            </li>
                        </#list>
                        <small class="form-text text-muted">Смотреть ещё</small>
                    </div>
                </div>
            </div>
        </div>

        <#--Gallery implementation script -->
        <script src="static/fancybox-master/dist/jq uery.fancybox.js"></script>
    </body>

</html>
