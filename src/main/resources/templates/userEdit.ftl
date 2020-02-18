<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
    <form action="/account/user" method="post">
        <h4 class="page-heading bottom-indent">Измените пользователя</h4>
        <div class="row">
            <div class="col-4 md-auto">
                <input class="form-control my-2" type="text" name="username" value="${user.username}">
            </div>
            <div class="col-2 md-auto">
                <#list roles as role>
                    <div>
                        <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                        <label>${role}</label>
                        <input type="hidden" value="${user.id}" name="userID">
                    </div>
                </#list>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Сохранить</button>
    </form>
    </@a.account>
</@c.page>