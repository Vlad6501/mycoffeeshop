<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include "parts/security.ftl">

<@c.page>
    <@a.account>
        <form action="/account/information" method="post">
            <#if info.user.id == id>
                <h4 class="page-heading bottom-indent">Введите новые данные</h4>

                <div class="row">
                    <div class="col-5 md-auto">
                        <table class="table">
                            <thead>
                            <tr>
                                <td>Имя:</td>
                                <td><input class="form-control my-2" type="text" name="firstname" value="${info.firstname}" /></td>
                            </tr>
                            <tr>
                                <td>Фамилия:</td>
                                <td><input class="form-control my-2" type="text" name="lastname" value="${info.lastname}" /></td>
                            </tr>
                            <tr>
                                <td>Отчество:</td>
                                <td><input class="form-control my-2" type="text" name="patronymic" value="${info.patronymic}" /></td>
                            </tr>
                            <tr>
                                <td>Эл. адрес:</td>
                                <td><input class="form-control my-2" type="email" name="email" value="${info.email}" /></td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="col-5 md-auto">
                        <table class="table">
                            <thead>
                            <tr>
                                <td>Город:</td>
                                <td><input class="form-control my-2" type="text" name="city" value="${info.city}" /></td>
                            </tr>
                            <tr>
                                <td>Адрес доставки(номер отделения Новой почты):</td>
                                <td><input class="form-control my-2" type="text" name="address" value="${info.address}" /></td>
                            </tr>
                            <tr>
                                <td>Номер телефона:</td>
                                <td><input class="form-control my-2" type="text" name="phone" value="${info.phone}" /></td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                <input type="hidden" value="${id}" name="userID">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button type="submit" class="btn btn-dark">Сохранить</button>
            <#else>
                <h4 class="page-title">Нет доступа</h4>
            </#if>
        </form>
    </@a.account>
</@c.page>