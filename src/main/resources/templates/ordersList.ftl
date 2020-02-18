<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#import 'parts/pager.ftl' as g>
<#include 'parts/security.ftl'>

<@c.page>
    <@a.account>
        <h4 class="page-heading bottom-indent">История заказов</h4>
        <p class="info-title">Список заказов, оформленных вами с момента регистрации в нашем магазине.</p>
        <#list page.content as order>
            <div class="album py-5 bg-light">
                <div class="container">
                    <#if id == order.user.id>
                    <div class="col-md-6">
                        <strong class="type">Номер заказа: ${order.id}</strong>
                        <table class="table">
                            <thead>
                            <tr>
                                <td>Дата оформление:</td>
                                <td>${order.date}</td>
                            </tr>
                            <tr>
                                <td>Статус:</td>
                                <td>${order.status}</td>
                            </tr>
                            <tr>
                                <td>Оплата:</td>
                                <td>${order.payment}</td>
                            </tr>
                            <tr>
                                <td>Состав заказ:</td>
                                <td>
                                    <#list order.productList as product>
                                        <#list order.numberList as number>
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
                                                            <td>${products.price} грн.</td>
                                                        </tr>
                                                        </thead>
                                                    </table>
                                                </#if>
                                            </#list>
                                        </#list>
                                    </#list>
                                </td>
                            </tr>
                            <tr>
                                <td>Стоимость заказ:</td>
                                <td>${order.price} грн.</td>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    </#if>
                </div>
            </div>
        </#list>
        <@g.pager url page />
    </@a.account>
</@c.page>