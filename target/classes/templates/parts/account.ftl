<#include "security.ftl">
<#macro account>
    <h1 class="h3 mb-3 text-center">Личный кабинет ${name}</h1>
    <div>
        <#if isAdmin>
            <a href="/account/user" class="btn btn-secondary btn-lg mb-1" role="button">Список пользоватилей</a>
            <a href="/account/allOrderList" class="btn btn-secondary btn-lg mb-1" role="button">Список заказов</a>
            <a href="/account/productList" class="btn btn-secondary btn-lg mb-1" role="button">Список товаров</a>
        <#else>
            <a href="/account/information" class="btn btn-secondary btn-lg mb-1" role="button">Моя информация</a>
            <a href="/account/orders" class="btn btn-secondary btn-lg mb-1" role="button">История и информация о заказах</a>
            <a href="/account/favoriteProducts" class="btn btn-secondary btn-lg mb-1" role="button">Мои избранные товары</a>
            <a href="/account/basket" class="btn btn-secondary btn-lg mb-1" role="button">Корзина</a>
        </#if>
    </div>
    <#nested>
</#macro>