<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as mainParts>
<#import "parts/SettingsPage/additionToSettings.ftlh" as activated>
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
        <@mainParts.header></@mainParts.header>

        <form method="get" action="/search">

            <#--Container with left and right menus and also with search-->
            <div class="container mt-3"  >
                <div class="row">

                    <#--Left menu-->
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 for-main-block-elements ">
                            <#if User.filename??>
                                <a data-fancybox="gallery" href="/img/${User.filename}">
                                    <img src="/img/${User.filename}" style="border-radius: 100px" width="150" height="150"/>
                                </a>
                            <#else>
                                <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" width="150" height="150"/>
                            </#if>
                            <h5 class="mt-0 mb-1">${User.name} ${User.surname}</h5>
                            <small id="emailHelp" class="form-text text-muted">${User.country}</small>
                            <button class="btn btn-white mt-0">
                                <span ><img src="/static/images/MainElements/recipes.png" alt="Выбрать файл" width="30"></span>
                                <span >Рецепты</span>
                            </button>
                        </div>
                    </div>

                    <#--Search-->
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6">

                        <div>
                            <div class="div-for-text-area pr-2 pl-2 mb-3" align="left">
                                <div class="media-body">
                                    <input type="text" name="search" value="${filter?if_exists}" class="text-area-search-page"
                                           rows="1" cols="70" placeholder="Поиск..."‍/>
                                </div>
                            </div>
                        </div>

                        <div align="center" >

                            <#list users as ul>
                                <div class="for-main-block-elements" align="left">
                                    <#if (ul.name)??>
                                        <#if ul.filename??>
                                            <a data-fancybox="gallery" href="/img/${ul.filename}">
                                                <img src="/img/${ul.filename}" style="border-radius: 100px" height="45" width="50"/>
                                            </a>
                                        <#else>
                                            <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                        </#if>
                                        <a href="user_page/id:${ul.id}" class="text-dark"> <strong> ${ul.name} ${ul.surname} </strong></a>
                                        <small class="form-text text-muted">${ul.country}</small>
                                    </#if>
                                </div>
                            <#else>
                            </#list>

                            <#list messages as messages>
                                <div class="for-main-block-elements" align="left">
                                    <label>
                                        <#if messages.avatar??>
                                            <a data-fancybox="gallery" href="/img/${messages.avatar}">
                                                <img src="/img/${messages.avatar}" style="border-radius: 100px" height="45" width="50"/>
                                            </a>
                                        <#else>
                                            <img src="/static/images/MainElements/People_icon1.png" style="border-radius: 100px" height="45" width="50" />
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
                            </#list>
                        </div>
                    </div>

                    <#--Right menu-->
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-xs-3 div-color-backgraund-main ">

                        <div class="for-main-block-elements pl-3" align="left">
                            <h5 class="mt-0 mb-1">Поиск по:</h5>

                            <div class="ml-4">
                                <input type="checkbox" name="filterByPeople" value="true" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Людям</label>
                            </div>

                            <div class="ml-4">
                                <input type="checkbox" name="filterByFitLenta" value="true" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Fit-lenta</label>
                            </div>

                            <div class="ml-4">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Рецептам</label>
                            </div>

                            <button type="submit" class="btn btn-primary mt-2">Поиск</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="static/fancybox-master/dist/jquery.fancybox.js"></script>
    </body>
</html>
