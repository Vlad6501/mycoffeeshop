<#import 'parts/navbar.ftl' as c>
<#include "parts/security.ftl">

<@c.page>
    <div class="policy-shop1">
        <div class="row">
            <div class="col-md-4 my-3">
                <div class="content-policy">
                    <div class="imgages"><a href="/delivery" target="_self"><img style="height: auto; max-width: 100%;" src="/img/Delivery_fast_2.png"/></a></div>
                    <h2>Быстрая доставка</h2>
                    <p>Доставка заказов в течении 1-2 дней</p>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="content-policy">
                    <div class="imgages"><a href="/delivery" target="_self"><img src="/img/Credit_card_2.png"/></a></div>
                    <h2>Visa / Mastercard</h2>
                    <p>Оплата картой онлайн без комиссии</p>
                </div>
            </div>
            <div class="col-md-4 my-3">
                <div class="content-policy">
                    <div class="imgages"><a href="/warranty" target="_self"><img src="/img/Safe_1_2.png"/></a></div>
                    <h2>Гарантия качества</h2>
                    <p>100% качественный товар</p>
                </div>
            </div>
        </div>
    </div>
    <div class="album py-2 bg-light">
        <div class="container">
            <h3 class="text-center">Рекомендуем</h3>
            <form action="/" method="post">
                <div class="row">
                    <#list page.content as product>
                        <div class="col-md-4">
                            <div class="card mb-3 shadow-sm">
                                <a href="/katalog/category/${product.id}">
                                    <img src="/img/${product.filename}" class="bd-placeholder-img card-img-top" width="100%" height="325" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>${product.productName}</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></img>
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">${product.productName}</h5>
                                    <#if product.number == 0 >
                                        <div class="stock available mb-3" title="Доступность">
                                            <strong class="type" style="color: #ff0306">Нет в наличии</strong>
                                        </div>
                                    </#if>
                                    <#if product.discount == 0>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <a href="/katalog/product/${product.id}/${id}" class="btn btn-dark" role="button">Купить</a>
                                                <span class="btn btn-dark">${product.price} грн.</span>
                                                <a class="btn btn-dark" href="/katalog/${id}/${product.id}/like">
                                                    <#if product.myLiked>
                                                        <i class="fas fa-heart"></i>
                                                    <#else>
                                                        <i class="far fa-heart"></i>
                                                    </#if>
                                                    ${product.likes}
                                                </a>
                                            </div>
                                        </div>
                                    <#else >
                                        <strong class="type" style="color: #ff0306">Старая цена(${product.price} грн.)</strong>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <a href="/katalog/product/${product.id}/${id}" class="btn btn-dark" role="button">Купить</a>
                                                <span class="btn btn-dark">${product.discount} грн.</span>
                                                <a class="btn btn-dark" href="/katalog/${id}/${product.id}/like">
                                                    <#if product.myLiked>
                                                        <i class="fas fa-heart"></i>
                                                    <#else>
                                                        <i class="far fa-heart"></i>
                                                    </#if>
                                                    ${product.likes}
                                                </a>
                                            </div>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            </form>
        </div>
    </div>
</@c.page>