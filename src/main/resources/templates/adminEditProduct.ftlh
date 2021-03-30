<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link href="/static/css/diary_file.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
<#--     Option 2: jQuery, Popper.js, and Bootstrap JS-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<!--Select2-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
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
            <a class="nav-link" href="/admin/exercise/editor">Exercise editor</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin/product/editor">Product editor</a>
        </li>
    </ul>
<form action="/diary/edit/product/${product.id}" class="was-validated" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="container">

        <label class="mb-3">Шаг 1: Укажите название и производителя продукта</label>
        <div class="form-row ">
            <div class="col-md-6 mb-3">
                <label>Название</label>
                <input type="text" class="form-control"  name="theProductsName" id="Inputname" value="${product.theProductsName} " id="#inputIn" required/>
            </div>

            <div class="col-md-6 mb-3">
                <label>Производитель</label>
                <input type="text" class="form-control" name="manufacturer" id="Inputsurname"
                       id="#inputIn" value="${product.manufacturer}" />
            </div>
        </div>

        <label class="mb-3">Шаг 2: Укажите белки, жиры и углеводы продукта</label>
        <div class="form-row ">
            <div class="col-md-4 mb-3">
                <label>Белки (гр)</label>
                <input type="text" class="form-control" name="protein" id="Inputname" value="${product.protein}"
                       id="#inputIn" required/>
            </div>

            <div class="col-md-4 mb-3">
                <label>Жиры (гр)</label>
                <input type="text" class="form-control" name="fat" id="Inputname" value="${product.fat}"
                       id="#inputIn" required/>
            </div>

            <div class="col-md-4 mb-3">
                <label>Углеводы (гр)</label>
                <input type="text" pattern="\d+(\.\d{2})?"
                       class="form-control" name="carbohydrates" id="Inputname" value="${product.carbohydrates}"
                       id="#inputIn" required/>

            </div>
        </div>

        <label class="mb-3">Шаг 3: Укажите калорийность и сахар в продукте</label>
        <div class="form-row ">
            <div class="col-md-6 mb-3">
                <label>Калории (Ккал)</label>
                <input type="text" class="form-control" name="calories" id="Inputname" value="${product.calories}"
                       id="#inputIn" required/>
            </div>

            <div class="col-md-6 mb-3">
                <label>Сахар (гр)</label>
                <input type="text" class="form-control" name="sugar" id="Inputname" value="${product.sugar}"
                       id="#inputIn" required>
            </div>
        </div>
        <input class="hide  " id="test" type="checkbox">

        <label for="test" class="col-md-10 mb-3">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
            </svg>
            Шаг 4 (необязательный шаг)
        </label>
        <div>
            <div class="form-row ">

                <div class="col-md-6 mb-3">
                    <label>Клетчатка (гр)</label>
                    <input type="text" class="form-control" name="cellulose" id="Inputname" value="${product.cellulose}"
                           id="#inputIn" />
                </div>

                <div class="col-md-6 mb-3">
                    <label>Натрий (мг)</label>
                    <input type="text" class="form-control" name="sodium" id="Inputname" value="${product.sodium}"
                           id="#inputIn" />
                </div>

                <div class="col-md-6 mb-3">
                    <label>Транс-жиры (гр)</label>
                    <input type="text" class="form-control" name="transFat" id="Inputname" value="${product.transFat}"
                           id="#inputIn" />
                </div>

                <div class="col-md-6 mb-3">
                    <label>Калий (мг)</label>
                    <input type="text" class="form-control" name="potassium" id="Inputname" value="${product.potassium}"
                           id="#inputIn" />
                </div>

                <div class="col-md-12 mb-3" >
                    <label>Насыщенные жиры (гр)</label>
                    <input type="text" class="form-control" name="saturatedFat" id="Inputname" value="${product.saturatedFat}"
                           id="#inputIn" />
                </div>

            </div>
        </div>
    </div>
    <div align="center">
        <a href="/admin/product/editor"> <button type="button" class="btn bg-danger text-white mr-5" >Назад</button></a>
        <button type="submit"  class="btn btn-primary">Сохранить</button>
    </div>
</form>
<script>
    document.getElementById("#checkIt").onclick = function() {
        alert(  /^\s*\d+[\.]?\d+\s*$/.test(document.getElementById("#inputIn").value));
    }
</script>
</body>
</html>