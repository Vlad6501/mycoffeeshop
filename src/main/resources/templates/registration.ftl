<#import 'parts/navbar.ftl' as c>
<#import 'parts/login.ftl' as l>
<@c.page>
    <h1 class="h3 mb-3 text-center">Регистрация</h1>
    <@l.login "/registration" true/>
</@c.page>