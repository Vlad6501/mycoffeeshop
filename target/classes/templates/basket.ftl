<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include "parts/security.ftl">

<@c.page>
    <@a.account>
    <#list baskets as basket>
        <#if basket.user.id = id>
            <h1 class="h3 mb-3 text-center">Корзина</h1>
            <div class="col-md-auto mx-3 ">
                <a href="/account/basket/deleteAllBasket/${basket.user.id}" class="btn btn-dark mb-3" role="button">Очистить корзину</a>
                <#list basketsList as basketList>
                    <#if basketList.basket.id == basket.id>
                        <#list basketList.productList as prodId>
                            <#list basketList.numberList as number>
                                <#list productList as products>
                                    <#if prodId == products.id>
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <td>Наименоварие:</td>
                                                <td>${products.productName}</td>
                                            </tr>
                                            <tr>
                                                <td>Количество:</td>
                                                <td>${number}
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>Цена:</td>
                                                <td>${products.price}</td>
                                            </tr>
                                            <tr>
                                                <td><a href="/account/basket/deleteProductInBasket/${basket.user.id}/${products.id}" class="btn-sm btn-dark" role="button">Удалить</a></td>
                                                <td></td>
                                            </tr>
                                            </thead>
                                        </table>
                                    </#if>
                                </#list>
                            </#list>
                        </#list>
                    </#if>
                </#list>
                <h5 class="h3 mb-3 text">Сума заказа ${basket.price} грн.</h5>
                <a href="/basket/createOrderForm/${id}" class="btn btn-dark" role="button">Оформить заказ</a>
            </div>
        </#if>
    </#list>
    </@a.account>
</@c.page>