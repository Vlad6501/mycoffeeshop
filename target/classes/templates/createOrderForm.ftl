<#import 'parts/navbar.ftl' as c>
<#include 'parts/security.ftl'>

<@c.page>
    <#list baskets as basket>
        <#if basket.user.id = id>
            <form action="/basket/createOrderForm" method="post">
                <h1 class="h3 mb-3 text-center">Оформление заказа</h1>
                <div class="col-md-auto mx-3 ">
                    <div>
                        <h3 class="h3 mb-3 text-center">Ваш заказ</h3>
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
                                                    </thead>
                                                </table>
                                            </#if>
                                        </#list>
                                    </#list>
                                </#list>
                            </#if>
                        </#list>
                        <h4 class="h3 mb-3 text-center">Сума заказа ${basket.price} грн.</h4>
                    </div>
                    <h3 class="h3 mb-3 text-center">Адрес доставки:</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Населенный пункт:</td>
                            <td><input class="form-control" type="text" name="city" value="${info.city}"/></td>
                        </tr>
                        <tr>
                            <td>Укажите номер отделения новой Почты:</td>
                            <td><input class="form-control" type="text" name="address" value="${info.address}" /></td>
                        </tr>
                        </thead>
                    </table>
                    <h3 class="h3 mb-3 text-center">Получатель:</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Имя:</td>
                            <td><input class="form-control" type="text" name="firstname" value="${info.firstname}" /></td>
                        </tr>
                        <tr>
                            <td>Фамилия:</td>
                            <td><input class="form-control" type="text" name="lastname" value="${info.lastname}" /></td>
                        </tr>
                        <tr>
                            <td>Отчество:</td>
                            <td><input class="form-control" type="text" name="patronymic" value="${info.patronymic}" /></td>
                        </tr>
                        <tr>
                            <td>Телефон в формате +380(68)345-21-56:</td>
                            <td><input class="form-control" type="text" name="phone" value="${info.phone}" /></td>
                        </tr>
                        </thead>
                    </table>
                    <h3 class="h3 mb-3 text-center">Способ оплаты:</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Способ оплаты:</td>
                            <td>
                                <select class="form-control my-2" name="paymentMethod">
                                    <option>Наложенный платеж</option>
                                    <option>Оплата на карту Приват Банка</option>
                                </select>
                                <strong class="type">Реквизиты для оплаты Вам вышлют отдельным сообжением после обработки и подверждения заказа</strong>
                            </td>
                        </tr>
                        </thead>
                    </table>
                    <input type="hidden" value="${id}" name="userID">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="btn btn-dark">Подтвердить заказ</button>
                </div>
            </form>
        </#if>
    </#list>
</@c.page>