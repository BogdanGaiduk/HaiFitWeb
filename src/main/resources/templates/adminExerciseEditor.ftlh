<#import "parts/main_parts/mainParts.ftlh" as mainMacro>
<#import "parts/AdminPanel/popUp.ftlh" as pops_up>

<html>
    <head>
        <meta charset="utf-8">
        <title>Exercise editor (Admin)</title>

        <link href="/css/diary_file.css" rel="stylesheet">
        <link href="/css/header_CSS.css" rel="stylesheet">
        <link href="/css/preloader.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <@mainMacro.preloader></@mainMacro.preloader>
        <#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
        <!--Select2-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
        <#--Верхнее меню-->
<#--        <@mainMacro.page></@mainMacro.page>-->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" href="/main">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                        <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                    </svg> Exit
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/admin">User editor</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/admin/exercise/editor">Exercise editor</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/product/editor">Product editor</a>
            </li>
        </ul>
        <div class="row mt-2 mr-1 ml-1">
            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" align="center">
                <button class="btn btn-info">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                <input type="text" name="search" style="border: gray solid 2px;height: 38px" placeholder="search by exercise id...">
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                <input type="text" name="search" style="border: gray solid 2px;height: 38px" placeholder="Exercise search...">
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" align="center">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#staticBackdrop">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                        </svg> Add exercise
                    </button>
                <@pops_up.addExercise></@pops_up.addExercise>
            </div>

        </div>
        <div class="row mr-1 ml-1 ">
            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="border: darkgray solid 3px" align="center" >id exercise</div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="border: darkgray solid 3px" align="center">
                Exercise
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="border: darkgray solid 3px" align="center">
                Kcal/min</div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="border: darkgray solid 3px" align="center">
                Link to article with description</div>
        </div>
        <#list Exercise as exercise>
            <div class="row mr-1 ml-1">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                    <button type="button" class="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="10" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg>
                    </button>
                    <button type="button" class="btn btn-success">
                        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="10" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                            <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                        </svg>
                    </button>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="border: darkgray solid 3px" align="center">
                    <a href="#">${exercise.id}</a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" style="border: darkgray solid 3px" align="center">
                    ${exercise.exercise}
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="border: darkgray solid 3px" align="center">
                    ${exercise.calories}
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="border: darkgray solid 3px" align="center">
                    ${exercise.link}
                </div>
            </div>
        </#list>
    </body>
</html>