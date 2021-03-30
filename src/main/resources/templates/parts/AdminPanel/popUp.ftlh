<#macro addExercise>
<form method="post" action="/admin/exercise/add" enctype="multipart/form-data" >
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleLabel">Добавьте новое упражнение в HaiFit</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="tab">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="exercise"  placeholder="Упражнение" id="#inputIn" required/>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="calories"  placeholder="Ккал/час" id="#inputIn" required/>
                        </div>
                        <div class="mb-3">
                                <input type="text" class="form-control" name="link" placeholder="Ссылка на статью с описанием" id="#inputIn" required/>
                        </div>
                        <div class="mb-3">
                            <label>Изображение</label>
                            <input type="file" name="filename" id="input__file" class="input input-file" multiple>
                            <label for="input__file" class="button-for-div-file">
                                <span ><img src="/static/images/MainElements/Photo.png" alt="Выбрать файл" width="30"></span>
                                <span >Фото</span>
                            </label>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn bg-danger text-white" data-dismiss="modal">Закрыть</button>
                    <button type="submit"  id="#checkIt" class="btn btn-primary">Сохранить</button>
                </div>
            </div>
        </div>
    </div>
</form>
</#macro>
<#macro addProduct>

    <form action="/diary/add_products/admin" class="was-validated" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <!-- Modal -->
        <div class="modal fade" id="addProductHaiFit" data-backdrop="static" data-keyboard="false"
             tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleLabel">Добавить продукт в HaiFit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="tab">

                            <div class="form-row ">

                                <label class="mb-3">Шаг 1: Укажите название и производителя продукта</label>

                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control"  name="theProductsName" id="Inputname" placeholder="Название" id="#inputIn" required/>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" name="manufacturer" id="Inputsurname"
                                           id="#inputIn" placeholder="Производитель (необязательно)" />
                                </div>
                            </div>

                            <div class="form-row ">

                                <label class="mb-3">Шаг 2: Укажите белки, жиры и углеводы продукта</label>

                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control" name="protein" id="Inputname" placeholder="Белки"
                                           id="#inputIn" required/>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control" name="fat" id="Inputname" placeholder="Жиры"
                                           id="#inputIn" required/>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control" name="carbohydrates" id="Inputname" placeholder="Углеводы"
                                           id="#inputIn" required/>
                                </div>
                            </div>

                            <div class="form-row ">

                                <label class="mb-3">Шаг 3: Укажите калорийность и сахар в продукте</label>

                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" name="calories" id="Inputname" placeholder="Калории"
                                           id="#inputIn" required/>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" name="sugar" id="Inputname" placeholder="Сахар"
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
                                        <input type="text" class="form-control" name="cellulose" id="Inputname" placeholder="Клетчатка (гр)"
                                               id="#inputIn" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" name="sodium" id="Inputname" placeholder="Натрий (мг)"
                                               id="#inputIn" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" name="transFat" id="Inputname" placeholder="Транс-жиры (гр)"
                                               id="#inputIn" />
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" name="potassium" id="Inputname" placeholder="Калий (мг)"
                                               id="#inputIn" />
                                    </div>

                                    <div class="col-md-12 mb-3" >
                                        <input type="text" class="form-control" name="saturatedFat" id="Inputname" placeholder="Насыщенные жиры (гр)"
                                               id="#inputIn" />
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn bg-danger text-white" data-dismiss="modal">Закрыть</button>
                            <button type="submit"  id="#checkIt" class="btn btn-primary">Сохранить продукт</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        document.getElementById("#checkIt").onclick = function() {
            alert(  /^\s*\d+[\.]?\d+\s*$/.test(document.getElementById("#inputIn").value));
        }
    </script>
<#--    </div>-->
</#macro>