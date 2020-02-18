<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
        <h4 class="page-heading bottom-indent">Список всех пользоватилей</h4>
        <form method="get" action="/account/user">
            <p class="text-left">Поиск по имени</p>
            <div class="row">
                <div class="col-3 md-auto">
                    <input class="form-control" type="text" name="filter" value="${filter}">
                </div>
            </div>
            <button type="submit" class="btn btn-dark my-2">Найти</button>
        </form>
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Role</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <thead>
            <#list usersList as user>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/account/user/${user.id}" class="btn-sm btn-dark" role="button">Изменить</a></td>
                </tr>
            </#list>
            </thead>
        </table>
    </@a.account>
</@c.page>
