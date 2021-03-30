<#--

Parts written for pop-ups:
-adding food to the common database (addProductInHaiFit;);
-adding food to the user's diary (addProductForTheUser);
-adding fit-exercise to the user's diary (addExerciseForTheUser);
-calorie calculator;
-the calendar

-->

<#macro addProductInHaiFit>

    <form action="/diary/add_products/diary" class="was-validated" method="post">
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
</#macro>

<#macro addProductForTheUser>

    <div class="modal-body">
        <div class="form-row ">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 mb-3">
                <select class="js-example-basic-multiple" style="width: 280px;"
                        multiple="multiple" name="id"  >
                    <#list product as product>
                        <option value="${product.id}">${product.theProductsName}</option>
                    </#list>
                </select>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 mb-3">
                <input type="text" class="form-control " id="validationTooltip03"
                       placeholder="Вес (грамм)"  name="productWeight" required>
            </div>
        </div>
        <div class="form-row ">
            <div class="col-md-10 mb-1 " align="left">
                <label style="color: white; outline: none;border: none;">
                    <h6>Дата :
                        <input  style="color: white" class="invisible-date" type="text" name="date" size="10" value="${dateModel}" readonly="">
                    </h6>
                </label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn bg-light" data-dismiss="modal">Закрыть</button>
        <button type="submit" class="btn bg-success">Добавить продукт</button>
    </div>
    <div class="tab">
        <#--                            neeew-->

    </div>

</#macro>

<#macro addExerciseForTheUser>
    <form action="/diary/addExercise" class="was-validated" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <!-- Modal -->
        <div class="modal fade" id="addMyExercise" data-backdrop="static" data-keyboard="false"
             tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleLabel">Моя активность</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-row ">
                            <div class="col-md-8 mb-3">
                                <select class=" testforpopupselect js-example-basic-multiple"
                                        multiple="multiple" name="exerciseId" style="width: 280px;"  >
                                    <#list exercises as exercise>
                                        <option value="${exercise.id}">${exercise.exercise}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <input type="text" class="form-control col-12 " id="validationTooltip03"
                                       placeholder="Время (мин)"  name="minutes" required>
                            </div>
                        </div>
                        <div class="form-row ">
                            <div class="col-md-10 mb-1 " align="left">
                                <label style="color: white">
                                    <h6>Дата :
                                        <input  style="color: white" class="invisible-date" type="text" name="date" size="10" value="${dateModel}" readonly="">
                                    </h6>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn bg-light" data-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn bg-success">Добавить активность </button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


</#macro>

<#macro calendar>
    <form action="/diary" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="e" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Выбор даты</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <#--                        value="dd-mm-yy"-->
                    <div class="modal-body">
                        <input type="text" value="dd-mm-yy" name="filterByDate" onfocus="this.select();_Calendar.lcs(this)"
                               onclick="event.cancelBubble=true;this.select();_Calendar.lcs(this)"
                               data-yearfrom="-80" data-yearto="5">
                        <button type="submit" class="btn bg-success">Поиск </button>
                    </div>
                    <div class="tab">
                        <#--                            neeew-->

                    </div>
                </div>
            </div>
        </div>
    </form>
</#macro>

<#macro calculator>
    <form action="/diary" method="get">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
             tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Расчитать КБЖУ 🔥</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="form-row ">
                                <div class="col-md-6 mb-3">
                                    <input type="text" id="height" class="form-control" name="height" placeholder="Рост" value="" required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" id="weight" class="form-control" name="weight" placeholder="Вес" value=""required />
                                </div>
                            </div>
                        </div>

                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="form-row ">
                                <div class="col-md-6 mb-3">
                                    <input type="text" id="age" class="form-control" name="age" placeholder="Возраст" value=""required />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <select id="sex" name="sex" class="custom-select" >
                                        <option value="">Пол </option>
                                        <option value="1">Мужчина</option>
                                        <option value="2">Женщина</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md mb-3"></div>
                        </div>

                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="col-md mb-3"></div>
                            <div class="col-md-12 mb-3">
                                <select id="coefficient" name="coefficient" class="custom-select" >
                                    <option value="">Активность </option>
                                    <option value="1.2">Сидячая работа</option>
                                    <option value="1.375">Легкие упражнения (1-2 раза в неделю)</option>
                                    <option value="1.462">Легкие упражнения (4-5 раз в неделю)</option>
                                    <option value="1.550">Интенсивные тренировки</option>
                                    <option value="1.637">Ежедневные тренировки</option>
                                    <option value="1.725">Ежедневные интенсивные тренировки</option>
                                    <option value="1.9">Интенсивные тренировки 2 раза в день</option>
                                </select>
                            </div>
                            <div class="col-md mb-3"></div>
                        </div>

                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="col-md-12 mb-3">
                                <select id="target" name="target" class="custom-select" >
                                    <option value="">Цель</option>
                                    <option value="1">Поддержание веса</option>
                                    <option value="0.2">Похудение</option>
                                    <option value="0.15">Набор веса</option>
                                </select>
                            </div>
                        </div>
                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="col-md-4 mb-3"><label> </label></div>
                            <div class="col-md-4 mb-3">
                                <label id="result">--</label> <label> </label> <label>Калорий</label>
                            </div>
                            <div class="col-md-4 mb-3"><label> </label></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn text-light bg-danger" data-dismiss="modal">Отмена</button>
                            <button type="button" onclick="func()" class="btn btn-primary">Расчитать</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function func(){
            var sex = Number(document.getElementById("sex").value);
            var weight = Number(document.getElementById("weight").value);
            var height = Number(document.getElementById("height").value);
            var age = Number(document.getElementById("age").value);
            var coefficient = Number(document.getElementById("coefficient").value);
            var target =Number(document.getElementById("target").value);
            let x=0;
            if(sex===1){
                const voo = 66.47 + (13.75 * weight) + (5.0 * height) - (6.74 * age);
                const sdd = (voo * 10) / 100;
                x = Math.round((voo + sdd) * coefficient);
            }
            if(sex===2){
                const voo  =  655.1 + 9.6 * weight + 1.85 * height - 4.68 * age;
                //        int A = (Integer.valueOf((int) voo));//ВОО В ЦЕЛЫХ ЧИСЛАХ
                const sdd = (voo * 10) / 100;//СДД
                //        int B = (Integer.valueOf((int) sdd));//СДД В ЦЕЛЫХ ЧИСЛАХ
                //(для поддержания)
                x = Math.round((voo + sdd) * coefficient);
            }
            if (target===1) {
                var result = x ;
            }
            if (target===0.2){
                var result =  Math.round(x-(x * target));
            }
            if (target===0.15){
                var result =  Math.round(x+(x * target));
            }


            document.getElementById("result").innerHTML = result;
        }
    </script>
</#macro>

