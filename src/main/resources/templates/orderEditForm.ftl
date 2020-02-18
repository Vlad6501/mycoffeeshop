<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
        <form action="/account/allOrderList/" method="post">
            <h4 class="page-heading bottom-indent">Измените заказ</h4>
            <div class="row">
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Статус:</td>
                            <td><select class="form-control my-2" name="status" value="${order.status}">
                                    <option>Принят</option>
                                    <option>Выполнен</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Оплята:</td>
                            <td>
                                <select class="form-control my-2" name="payment" value="${order.payment}">
                                    <option>Оплатите</option>
                                    <option>Оплачен</option>
                                </select>
                            </td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <input type="hidden" value="${order.id}" name="orderID">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-dark">Сохранить</button>
        </form>
    </@a.account>
</@c.page>