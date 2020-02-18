<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include "parts/security.ftl">

<@c.page>
    <@a.account>
        <h4 class="page-heading bottom-indent">Информация о ползователе</h4>
        <#list users as userinfo>
            <#if id == userinfo.user.id>
                <table class="table">
                    <thead>
                    <tr>
                        <td>Имя:</td>
                        <td>${userinfo.firstname}</td>
                    </tr>
                    <tr>
                        <td>Фамилия:</td>
                        <td>${userinfo.lastname}</td>
                    </tr>
                    <tr>
                        <td>Отчество:</td>
                        <td>${userinfo.patronymic}</td>
                    </tr>
                    <tr>
                        <td>Эл. адрес:</td>
                        <td>${userinfo.email}</td>
                    </tr>
                    <tr>
                        <td>Номер телефона:</td>
                        <td>${userinfo.phone}</td>
                    </tr>
                    <tr>
                        <td>Город:</td>
                        <td>${userinfo.city}</td>
                    </tr>
                    <tr>
                        <td>Адрес доставки(номер отделения Новой почты):</td>
                        <td>${userinfo.address}</td>
                    </tr>
                    </thead>
                </table>
                <a href="/account/information/${userinfo.id}" class="btn btn-dark" role="button">Изменить</a>
            </#if>
        </#list>
    </@a.account>
</@c.page>