<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include 'parts/security.ftl'>
<#import 'parts/pager.ftl' as g>

<@c.page>
    <@a.account>
        <h4 class="page-heading bottom-indent">Мои любимые товары</h4>
        <p class="info-title">Здесь собраны товары, которые вам понравились.</p>
        <div class="album py-5 bg-light">
            <div class="container">
                <form action="/katalog/" method="post">
                    <div class="row">
                        <#list page.content as product>
                            <#if product.myLiked>
                            <div class="col-md-4">
                                <div class="card mb-3 shadow-sm">
                                    <a href="/katalog/product/${product.id}/${id}">
                                        <img src="/img/${product.filename}" class="bd-placeholder-img card-img-top" width="100%" height="325" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>${product.productName}</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></img>
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">${product.productName}</h5>
                                        <#if product.number == 0 >
                                            <div class="stock available mb-3" title="Доступность">
                                                <strong class="type">Нет в наличии</strong>
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
                                            <strong class="type">Старая цена(${product.price} грн.)</strong>
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
                            </#if>
                        </#list>
                    </div>
                </form>
            </div>
        </div>
        <@g.pager url page />
    </@a.account>
</@c.page>