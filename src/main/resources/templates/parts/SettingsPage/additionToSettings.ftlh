<#macro privacyPage>
    <select  id="inlineFormCustomSelect">
        <option value="1">Только я</option>
        <option value="2">Мои друзья</option>
        <option value="3">Все друзья</option>
    </select>
</#macro>

<#macro verificationUser>
    <#if User.code == "activated">
        <label>
            <a data-toggle="modal" class="text-success" data-target="#pop_up_security_1">
                Страница верифицирована
            </a>
        </label>
    <#else>
        <label>
            <a data-toggle="modal" class="text-primary" data-target="#pop_up_security_1">
                Страница не верифицирована
            </a>
        </label>
    </#if>
</#macro>

<#macro userInformation>
    <div class="add-product-button">
        <form action="/user/edit" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <!-- Modal -->
            <div class="modal fade" id="Pop_up_user_information" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">

                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Изменения информации о пользователе</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="form-row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 mb-3">
                                    <input type="text" class="form-control" name="name" value="${User.name}"required />
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 mb-3">
                                    <input type="text" class="form-control" name="surname" value="${User.surname}"required />
                                </div>
                            </div>

                            <div class="form-group mb-3  ">
                                <select name="country" class="custom-select"  >
                                    <option value="">${User.country}</option>
                                    <#list country as country>
                                        <option value="${country}" id="country">${country}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3" align="center">
                            <small  class="form-text text-muted">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-octagon" viewBox="0 0 16 16">
                                    <path d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353L4.54.146zM5.1 1L1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1H5.1z"/>
                                    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
                                </svg>
                                По правилам честного использования HaiFit нельзя изменить пол и дату рождения.
                                Если, Вы, ошибочно указали свои данные можете обратится в службу поддержки
                            </small>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn bg-danger" data-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn bg-success">Сохранить</button>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
  </#macro>

<#macro securityInformation>
      <div class="add-product-button">
          <form action="/user/edit" method="post">
              <input type="hidden" name="_csrf" value="${_csrf.token}"/>
              <!-- Modal -->
              <div class="modal fade" id="pop_up_security" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">

                      <div class="modal-content">

                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Изменения безопасности</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                          </div>

                          <div class="tab mt-3 mr-3 ml-3">
                              <div class="form-row ">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3 ">
                                      <input type="password" class="form-control" id="InputPassword"
                                             placeholder="Пароль" name="password"
                                              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required/>
                                      <small id="emailHelp" class="form-text text-muted">
                                          Минимум 6 символов с минимум одной буквой от A-Z и a-z
                                      </small>
                                      <input type="Email" class="form-control mt-3" name="email"
                                              placeholder="E-mail" value="${User.username}" required/>
                                  </div>
                              </div>
                          </div>

                          <div class="modal-footer">
                              <button type="button" class="btn bg-danger" data-dismiss="modal">Закрыть</button>
                              <button type="submit" class="btn bg-success">Сохранить</button>
                          </div>

                      </div>
                  </div>
              </div>
          </form>
      </div>

  </#macro>

<#macro verificationText>
      <div class="add-product-button">
          <form action="/user/activated" method="post">
              <div class="preloader">
                  <div class="preloader__row">
                      <div class="preloader__item"></div>
                      <div class="preloader__item"></div>
                  </div>
              </div>
              <input type="hidden" name="_csrf" value="${_csrf.token}"/>
              <!-- Modal -->
              <div class="modal fade" id="pop_up_security_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">

                      <div class="modal-content">

                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Подробнее о верификации</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                          </div>

                          <div class="tab mt-3 mr-3 ml-3">
                              <div class="form-row ">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="left">

                                        <input class="hide" id="q1" type="checkbox">
                                        <label for="q1" class="ml-2 mr-2 ">
                                            <p><em>Что такое верификация?</em></p>
                                        </label>
                                        <div>
                                            <label class="text-muted">Верификация – это процесс подтверждения достоверности данных личности,
                                                которая является владельцем учетной записи</label>
                                            <br><br>
                                        </div>

                                        <input class="hide" id="q2" type="checkbox">
                                        <label for="q2" class="ml-2 mr-2 ">
                                            <p><em>Какие данные FitPlan проверяет?</em></p>
                                        </label>
                                        <div>
                                            <label class="text-muted"> По этой верификации идет
                                                проверка актуального E-mail адресса</label>
                                            <br><br>
                                        </div>

                                        <input class="hide" id="q3" type="checkbox">
                                        <label for="q3" class="ml-2 mr-2 ">
                                            <p><em>Что даст мне верификация?</em></p>
                                        </label>
                                        <div>
                                            <label class="text-muted">
                                                <p>- Доступ к отправке сообщений;</p>
                                                <p>- Доступ к возможности вылаживать записи на Fit-lenta;</p>
                                                <p>- Доступ к возможности добавлении друзей;</p>
                                                <p>- Доступ к любому поиску на Fit-Plan;</p>
                                            </label>
                                            <br><br>
                                        </div>

                                        <input class="hide" id="q4" type="checkbox">
                                        <label for="q4" class="ml-2 mr-2 ">
                                            <p><em>Как выполнить верификацию?</em></p>
                                        </label>
                                        <div>
                                            <label class="text-muted">Для этого достаточно перейти по ссылке,
                                                которая была отправлена на ваш E-mail <a class="text-primary">(${User.username})</a>.
                                                <p>Если ссылка была утерена, Вы, можете отправить её повторно на свою почту.</label>
                                                </p>
                                            <br><br>
                                            <br><br>
                                        </div>

                                        <p>
                                              <#if User.code == "activated">
                                                  <label   class="text-success"  >
                                                      Ваша страница верифицирована
                                                  </label>
                                              <#else>
                                                  <button   class="btn  btn-white text-primary"  >
                                                      Ваша страница верифицирована не верифицирована, отправить ссылку верификации? Нажмите на ссылку
                                                  </button>
                                              </#if>
                                        </p>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </form>
      </div>

</#macro>

<#macro diaryInformation>
    <div class="add-product-button">
        <form action="/user/edit" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <!-- Modal -->
            <div class="modal fade" id="pop_up_for_diary" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">

                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Изменения данных для дневника</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="tab mt-3 mr-3 ml-3">
                            <div class="form-row " align="center">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3"></div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mb-3">
                                    <input type="text" class="form-control" name="weight" value="${User.weight}"required />
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 mb-3">
                                    <label>кг</label>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 mb-3">
                                    <input type="text" class="form-control" name="height" value="${User.height}"required />
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 mb-3">
                                    <label>см</label>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 mb-3"></div>
                            </div>
                            <div class="tab mt-3 mr-3 ml-3">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
                                    <select name="coefficient" class="custom-select" >
                                        <option value="">${coefficient}</option>
                                        <option value="1.2">Сидячая работа</option>
                                        <option value="1.375">Легкие упражнения (1-2 раза в неделю)</option>
                                        <option value="1.462">Легкие упражнения (4-5 раз в неделю)</option>
                                        <option value="1.550">Интенсивные тренировки</option>
                                        <option value="1.637">Ежедневные тренировки</option>
                                        <option value="1.725">Ежедневные интенсивные тренировки</option>
                                        <option value="1.9">Интенсивные тренировки 2 раза в день</option>
                                    </select>
                                </div>
                            </div>

                            <div class="tab mt-3 mr-3 ml-3">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
                                    <select name="target" class="custom-select" >
                                        <option value="">${target}</option>
                                        <option value="1">Поддержание веса</option>
                                        <option value="2">Похудение</option>
                                        <option value="3">Набор веса</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn bg-light" data-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn bg-success">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</#macro>