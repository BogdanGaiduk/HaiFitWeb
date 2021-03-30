<#import "parts/main_parts/mainParts.ftlh" as c>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <@c.title></@c.title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<body>
<#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<div class="jumbotron" style="background-color: #9acbc4">
    <h1 class="display-4">Привет !</h1>
    <p class="lead">Пользователь с такими данными уже был создан.</p>
    <hr class="my-4">
    <p>Введите актуальные данные для регистрации или же <a class="btn btn-primary btn" href="/login" role="button">Войдите</a> в свой аккаунт. <a href="#">Забыли пароль ?</a></p>
    <div align="center">

        <img src="../static/images/main_page/Main_elements/Avocado.gif">

    </div>
    <p class="lead">
    </p>
</div>
</body>
</html>