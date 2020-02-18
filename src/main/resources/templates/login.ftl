<#import 'parts/navbar.ftl' as c>
<#import 'parts/login.ftl' as l>
<@c.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <h1 class="h3 mb-3 text-center">Вход</h1>
    <@l.login "/login" false/>
</@c.page>