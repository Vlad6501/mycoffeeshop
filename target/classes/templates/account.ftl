<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include "parts/security.ftl">

<@c.page>
    <@a.account>
        <h3 class="page-title">Добро пожаловать в вашу учетную запись.</h3>
        <h5 class="page-title">Здесь вы можете управлять личными данными и заказами.</h5>
    </@a.account>
</@c.page>