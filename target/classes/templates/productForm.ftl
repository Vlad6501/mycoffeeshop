<#import 'parts/navbar.ftl' as c>
<#include "parts/security.ftl">

<@c.page>
    <form action="/katalog/product" method="post">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Главная</a></li>
                <li class="breadcrumb-item"><a href="/katalog">Каталог</a></li>
                <li class="breadcrumb-item active" aria-current="page">${product.productName}</li>
            </ol>
        </nav>
        <div class="row ">
            <div class="col-md-4 my-3 pl-3">
                <img src="/img/${product.filename}" class="bd-placeholder-img card-img-top" width="100%" height="360" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>${product.productName}</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></img>
            </div>
            <div class="col-md-8 my-3">
                <h1 class="page-title">${product.productName}</h1>
                <h5 class="page-title">Код товара:</h5>
                <strong class="type">${product.id}</strong>
                <#if product.number != 0 >
                    <div class="stock available" title="Доступность">
                        <strong class="type">Есть в наличии</strong>
                    </div>
                <#else>
                    <div class="stock available" title="Доступность">
                        <strong class="type">Нет в наличии</strong>
                    </div>
                </#if>
                <h4 class="page-title">Цена:</h4>
                <#if product.discount == 0>
                    <strong class="type">${product.price} грн.</strong>
                <#else >
                    <strong class="type">Старая цена(${product.price} грн.)</strong>
                    <strong class="type">${product.discount} грн.</strong>
                </#if>
                <h5 class="page-title">Количество:</h5>
                <div class="row">
                    <div class="col-3 3 my-2">
                        <input class="form-control" type="number" name="checkNumber" value="1"/>
                    </div>
                    <div class="col-auto my-2">
                        <div class="btn-group ">
                            <input type="hidden" value="${id}" name="userID">
                            <input type="hidden" value="${product.id}" name="productID">
                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                            <button type="submit" class="btn btn-dark">Добавить в корзину</button>
                            <#if true>
                                <i class="fas fa-heart"></i>
                            <#else>
                            <i class="far fa-heart"></i>
                            </#if>
                        </div>
                        <#if message>
                            <strong class="type">Недостаточно товара</strong>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="col-md-auto mx-3 ">
                <h1 class="page-title">Описание</h1>
                <p style="text-align: justify;">
                    ${product.specification}
                </p>
            </div>

            <div class="col-md-auto mx-3 ">
                <h1 class="page-title">Характеристики</h1>
                <table class="table">
                    <#if product.category == "ACCESSORIES">
                        <thead>
                        <tr>
                            <td>Производитель:</td>
                            <td>${prodSpecific.manufacturer}</td>
                        </tr>
                        <tr>
                            <td>Страна производитель:</td>
                            <td>${prodSpecific.country}</td>

                        </tr>
                        </thead>
                    <#else >
                        <thead>
                        <tr>
                            <td>Производитель:</td>
                            <td>${prodSpecific.manufacturer}</td>
                        </tr>
                        <tr>
                            <td>Страна производитель:</td>
                            <td>${prodSpecific.country}</td>

                        </tr>
                        <tr>
                            <td>Состав:</td>
                            <td>${prodSpecific.composition}</td>
                        </tr>
                        <tr>
                            <td>Тип:</td>
                            <td>${prodSpecific.type}</td>
                        </tr>
                        <tr>
                            <td>Упаковка:</td>
                            <td>${prodSpecific.packaging}</td>
                        </tr>
                        <tr>
                            <td>Вес:</td>
                            <td>${prodSpecific.weight}</td>
                        </tr>
                        <tr>
                            <td>Хранение:</td>
                            <td>${prodSpecific.validity}</td>
                        </tr>
                        <tr>
                            <td>Рекомендуется для приготовления:</td>
                            <td>${prodSpecific.recommended}</td>
                        </tr>
                        </thead>
                    </#if>
                </table>
            </div>
        </div>
    </form>
</@c.page>