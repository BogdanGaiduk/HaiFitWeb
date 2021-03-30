<#--

Parts written for pop-ups for adding food to:
-breakfast;
-dinner;
-evening;
-snack

-->

<#import "popUpForDiaryPage.ftlh" as addProductForTheUser>

<#macro breakfast>
    <form action="/diary/addDiaryBreakfast" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="Pop_up_for_breakfast" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Добавить продукт в завтрак 🌥</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <@addProductForTheUser.addProductForTheUser></@addProductForTheUser.addProductForTheUser>
                </div>
            </div>
        </div>
    </form>
</#macro>

<#macro dinner>
    <form action="/diary/addDiaryDinner" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="Pop_up_for_dinner" tabindex="-1" role="dialog" aria-labelledby="exampleModaabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModaabel">Выберите продукт в обед 🌤</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <@addProductForTheUser.addProductForTheUser></@addProductForTheUser.addProductForTheUser>
                </div>
            </div>
        </div>
    </form>
</#macro>

<#macro evening>
    <form action="/diary/addDiaryEvening" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="Pop_up_for_evening" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Добавить продукт в ужин 🌓</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <@addProductForTheUser.addProductForTheUser></@addProductForTheUser.addProductForTheUser>
                </div>
            </div>
        </div>
    </form>
</#macro>

<#macro snack>
    <form action="/diary/addDiarySnack" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <!-- Modal -->
        <div class="modal fade" id="Pop_up_for_snack" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Добавить продукт в перекус 🥙</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <@addProductForTheUser.addProductForTheUser></@addProductForTheUser.addProductForTheUser>
                </div>
            </div>
        </div>
    </form>
</#macro>