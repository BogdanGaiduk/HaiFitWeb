<#import "../popUpAddProduct.ftlh" as popUpAddInBreakfast>

<#macro page>
    <div class="container  div-block-meals" align="left">

        <div class="row mb-2 ml-1 mr-1">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3  left-column-style-for-meals" align="center">
                <label for="hd-1">Завтрак 🌥</label>
            </div>
            <div class="col-lg col-md col-sm col-xs"></div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 right-column-style-for-meals"  align="center" >
                    <label>${caloriesBreakfasts} Калорий</label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm">
                <div class="pb-3 mb-2" style="background-color: #444444; border-radius: 10px">
                   <input class="hide  " id="breakfast" type="checkbox">
                    <label for="breakfast" class="ml-2 mr-2 " style=" color:white;">
                        |&nbsp;&nbsp;Б ${proteinBreakfasts}&nbsp;&nbsp;|&nbsp;&nbsp;Ж ${fatBreakfasts}&nbsp;&nbsp;|&nbsp;&nbsp;У ${carbohydratesBreakfasts}&nbsp;&nbsp;|&nbsp;&nbsp;РСК ${RSKBreakfasts}%&nbsp;&nbsp;|
                    </label>

                    <div>

                        <div class="row mb-0 ml-1 mr-1">

                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 p-0"
                                 align="center">
                                <label style="text-align: center; font-size: large;">Название</label>
                                <br>
                                <div style="border-right: gray solid 3px;" align="left">
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        <a href="#" style="color: green">${diaryBreakfasts.productName}</a>
                                        <br>
                                    </#list>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 p-0" align="center">
                                <label style="padding-right: 32%; text-align: center;font-size: large;">Вес</label>
                                <br>
                                <div style="border-right: gray solid 3px;">
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        ${diaryBreakfasts.productWeight}
                                        <br>
                                    </#list>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 p-0" align="center">
                                <label style="text-align: center;font-size: large;">Б</label>
                                <br>
                                <div style="border-right: gray solid 3px;">
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        ${diaryBreakfasts.protein}
                                        <br>
                                    </#list>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 p-0" align="center">
                                <label style="text-align: center;font-size: large;">Ж</label>
                                <br>
                                <div style="border-right: gray solid 3px;">
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        ${diaryBreakfasts.fat}
                                        <br>
                                    </#list>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 p-0" align="center">
                                <label style="text-align: center;font-size: large;">У</label>
                                <br>
                                <div style="border-right: gray solid 3px;">
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        ${diaryBreakfasts.carbohydrates}
                                        <br>
                                    </#list>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 p-0" align="center">
                                <label style="text-align: center;font-size: large;">Ккал</label>
                                <br>
                                <div>
                                    <#list diaryBreakfasts as diaryBreakfasts>
                                        ${diaryBreakfasts.calories}
                                        <br>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div align="center">
                    <button type="button" class="btn add-product-button" data-toggle="modal" data-target="#Pop_up_for_breakfast">
                        <label style="color: white; font-weight: bold "> + Добавить продукт </label>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <@popUpAddInBreakfast.breakfast></@popUpAddInBreakfast.breakfast>

</#macro>