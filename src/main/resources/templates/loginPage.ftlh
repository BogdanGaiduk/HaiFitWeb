<!--<input type="hidden" name="_csrf" value="{_csrf.token}}" /> - add to all submitted forms  -->

<#import "parts/main_parts/mainParts.ftlh" as c>

<html>
    <head>
        <meta charset="utf-8">
        <@c.title></@c.title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>

    <body style="background-color: #1D4354; background-size: 100%;">

        <#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>


        <div class="container ">
            <div class="row">
                <div class="col-lg col-md col-sm col-xs  mt-5"></div>
                <div class="col-lg col-md col-sm col-xs  mt-5"></div>
                <div class="col-lg col-md col-sm col-xs  mt-5"></div>
            </div>
        </div>

        <div class="container mt-5">

            <div class="row">

                <div class="col-lg col-md col-sm col-xs">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                        <img src="/static/images/Logo_for_login_page.png" width="200" height="60">
                    </div>
                    <img src="/static/images/LoginPage/tagline.png" width="600" height="200">
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="background: white;border-radius: 10px;">

                    <form action="/login" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />

                        <div class="form-group row justify-content-center mt-5" >
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                <input type="text" name="username" class="form-control" placeholder="E-mail" required />
                            </div>
                        </div>

                        <div class="form-group row justify-content-center" >
                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" >
                                <input type="password" name="password" class="form-control" placeholder="Пароль"  required />
                            </div>
                        </div>

                        <div class="mt-1" align="center">
                            <button class="btn btn-primary col-sm-9" type="submit">Войти</button>
                            <br>
<#--                            <form action="/main/edit_login_password" method="get">-->
                                <a href="/main/edit_login_password">Забыли пароль?</a>
<#--                            </form>-->
                        </div>

                        <div class="mt-3 mb-5" align="center">
                            <a href="/registration" class="btn btn-secondary btn-success " role="button" aria-disabled="true">Создать аккаунт</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

