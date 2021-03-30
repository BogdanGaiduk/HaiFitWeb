<#import "parts/main_parts/mainParts.ftlh" as c>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/static/css/registration.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <@c.title></@c.title>
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

        <div class="container ">
            <div class="row" >
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <form action="/main/edit_login_password" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <div class="form-group row justify-content-center mt-5" >
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                                <p class="text-dark font-weight-bold">
                                    Введите ваш e-mail, чтобы мы смогли найти ваш аккаунт и отправить персональное письмо о востановлении пароля для вашего аккаунта.
                                </p>
                                <label class="text-dark font-weight-bold">Введите e-mail:</label>
                                <input align="center" type="text" name="username" class="form-control" placeholder="E-mail" required />
                                <button type="submit" class=" mt-3 btn btn-light">Отправить письмо</button>
                                <label class="text-danger font-weight-normal">${message}</label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>