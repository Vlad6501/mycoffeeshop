<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
        <form action="/account/allOrderList" method="get">
            <p class="text-left">Поиск по имени (username)</p>
            <div class="row">
                <div class="col-3 md-auto">
                    <input class="form-control" type="text" name="filter" value="${username}">
                </div>
            </div>
            <button type="submit" class="btn btn-dark my-2">Найти</button>
            <h4 class="page-heading bottom-indent">Список всех заказов</h4>
            <div class="bd-example">
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">ProductList</th>
                        <th scope="col">Date</th>
                        <th scope="col">Price</th>
                        <th scope="col">Status</th>
                        <th scope="col">Payment</th>
                        <th scope="col">PaymentMethod</th>
                        <th scope="col">User</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <thead>
                    <#list ordersList as orders>
                        <tr>
                            <td>${orders.id}</td>
                            <td>
                                <#list orders.productList as product>
                                    <#list orders.numberList as number>
                                        <#list productList as products>
                                            <#if product == products.id>
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <td>Наименование:</td>
                                                        <td>${products.productName}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Количество:</td>
                                                        <td>${number}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Стоимость:</td>
                                                        <td>${products.price}</td>
                                                    </tr>
                                                    </thead>
                                                </table>
                                            </#if>
                                        </#list>
                                    </#list>
                                </#list>
                            </td>
                            <td>${orders.date}</td>
                            <td>${orders.price}</td>
                            <td>${orders.status}</td>
                            <#if orders.paymentMethod == "Наложенный платеж">
                                <td></td>
                            <#else>
                                <td>${orders.payment}</td>
                            </#if>
                            <td>${orders.paymentMethod}</td>
                            <td>
                                <#list information as info>
                                    <#if info.user == orders.user>
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <td>${orders.user.username}</td>
                                            </tr>
                                            <tr>
                                                <td>${info.firstname}</td>
                                            </tr>
                                            <tr>
                                                <td>${info.lastname}</td>
                                            </tr>
                                            <tr>
                                                <td>${info.phone}</td>
                                            </tr>
                                            </thead>
                                        </table>
                                    </#if>
                                </#list>
                            </td>
                            <td>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <td><a href="/account/allOrderList/${orders.id}" class="btn-sm btn-dark" role="button">Изменить</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="/account/allOrderList/delete/${orders.id}" class="btn-sm btn-dark" role="button">Удалить</a></td>
                                    </tr>
                                    </thead>
                                </table>
                            </td>
                        </tr>
                    </#list>
                    </thead>
                </table>
            </div>
        </form>
    </@a.account>
</@c.page>