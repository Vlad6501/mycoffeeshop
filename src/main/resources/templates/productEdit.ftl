<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
        <form action="/account/productList" method="post">
            <h4 class="page-heading bottom-indent">Измените товар</h4>
            <div class="row">
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Название:</td>
                            <td><input class="form-control my-2" type="text" name="productName" value="${prod.productName}"/></td>
                        </tr>
                        <tr>
                            <td>Цена:</td>
                            <td><input class="form-control my-2" type="number" name="price" value="${prod.price}"/></td>
                        </tr>
                        <tr>
                            <td>Акционная цена:</td>
                            <td><input class="form-control my-2" type="number" name="discount" value="${prod.discount}"/></td>
                        </tr>
                        <tr>
                            <td>Количество:</td>
                            <td><input class="form-control my-2" type="number" name="number" value="${prod.number}"/></td>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Описание:</td>
                            <td><input class="form-control my-2" rows="3" name="specification" value="${prod.specification}" /></td>
                        </tr>
                        <tr>
                            <td>Категория:</td>
                            <td>
                                <select class="form-control my-2" name="category" value="${prod.category}">
                                    <option>COFFEE</option>
                                    <option>COFFEEMACHINES</option>
                                    <option>COFFEEGRINDERS</option>
                                    <option>ACCESSORIES</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Раздел:</td>
                            <td>
                                <select class="form-control my-2" name="section" value="${prod.section}">
                                    <option>GRAINS</option>
                                    <option>CAPSULES</option>
                                    <option>PADS</option>
                                    <option>GROUND</option>
                                    <option>PROFESSIONAL</option>
                                    <option>HORN</option>
                                    <option>AUTOMATIC</option>
                                    <option>HOUSEHOLD</option>
                                    <option>MANUAL</option>
                                    <option>TOOLS</option>
                                    <option>TEMPERS</option>
                                    <option>PITCHERS</option>
                                    <option>LIBRA</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Картинка:</td>
                            <td><input class="form-control-file my-2" type="file" name="file" value="${prod.filename}"/></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <h4 class="page-heading bottom-indent">Измените характерисики товара</h4>
            <div class="row">
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Производитель:</td>
                            <td><input class="form-control my-2" type="text" name="manufacturer" value="${prodSpecific.manufacturer}"/></td>
                        </tr>
                        <tr>
                            <td>Состав:</td>
                            <td><input class="form-control my-2" type="text" name="composition" value="${prodSpecific.composition}"/></td>
                        </tr>
                        <tr>
                            <td>Тип:</td>
                            <td><input class="form-control my-2" type="text" name="type" value="${prodSpecific.type}"/></td>
                        </tr>
                        <tr>
                            <td>Упаковка:</td>
                            <td><input class="form-control my-2" type="text" name="packaging" value="${prodSpecific.packaging}" /></td>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Вес:</td>
                            <td><input class="form-control my-2" type="text" name="weight" value="${prodSpecific.weight}" /></td>
                        </tr>
                        <tr>
                            <td>Страна производитель:</td>
                            <td><input class="form-control my-2" type="text" name="country" value="${prodSpecific.country}" /></td>

                        </tr>
                        <tr>
                            <td>Хранение:</td>
                            <td><input class="form-control my-2" type="text" name="validity" value="${prodSpecific.validity}"/></td>
                        </tr>
                        <tr>
                            <td>Рекомендуется для приготовления:</td>
                            <td><input class="form-control my-2" type="text" name="recommended" value="${prodSpecific.recommended}"/></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <input type="hidden" value="${prod.id}" name="productID">
            <input type="hidden" value="${prodSpecific.id}" name="prodSpecificID">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-dark">Сохранить</button>
        </form>
    </@a.account>
</@c.page>