<#macro subscribers>
    <div class="modal fade" id="subscribers" data-backdrop="static" data-keyboard="false"
     tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleLabel">Подписчики</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <ul class="list-group">
                        <#list usersSubscribers as user>
                            <li class="media mt-1">
                                <#if user.filename??>
                                    <a data-fancybox="gallery" href="/img/${user.filename}">
                                        <img src="/img/${user.filename}" style="border-radius: 100px" height="45" width="50"/>
                                    </a>
                                <#else>
                                    <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                </#if>
                                <div class="media-body pl-2">
                                    <a href="/user_page/id:${user.id}" class="text-body">${user.name} ${user.surname}</a>
                                </div>
                            </li>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro Subscriptions>
    <div class="modal fade" id="subscriptions" data-backdrop="static" data-keyboard="false"
         tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleLabel">Подписки</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <ul class="list-group">
                        <#list usersSubscriptions as user>
                            <li class="media mt-1">
                                <#if user.filename??>
                                    <a data-fancybox="gallery" href="/img/${user.filename}">
                                        <img src="/img/${user.filename}" style="border-radius: 100px" height="45" width="50"/>
                                    </a>
                                <#else>
                                    <img src="/static/images/MainElements/peopleIcon1.png" style="border-radius: 100px" height="45" width="50" />
                                </#if>
                                <div class="media-body pl-2">
                                    <a href="/user_page/id:${user.id}" class="text-body">${user.name} ${user.surname}</a>
                                </div>
                            </li>
                        </#list>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</#macro>