<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>
<#include "parts/security.ftl">

<@c.page>
    <@a.account>
        <form action="/account/productList/newProduct" method="post" enctype="multipart/form-data">
            <h4 class="page-heading bottom-indent">Введите данные</h4>
            <div class="row">
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Название:</td>
                            <td><input class="form-control my-2" type="text" name="productName"/></td>
                        </tr>
                        <tr>
                            <td>Цена:</td>
                            <td><input class="form-control my-2" type="number" name="price"/></td>
                        </tr>
                        <tr>
                            <td>Акционная цена:</td>
                            <td><input class="form-control my-2" type="number" name="discount" value="0"/></td>
                        </tr>
                        <tr>
                            <td>Количество:</td>
                            <td><input class="form-control my-2" type="number" name="number"/></td>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Описание:</td>
                            <td><input class="form-control my-2" rows="3" name="specification"/></td>
                        </tr>
                        <tr>
                            <td>Категория:</td>
                            <td>
                                <select class="form-control my-2" name="category">
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
                                <select class="form-control my-2" name="section">
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
                            <td><input class="form-control-file my-2" type="file" name="file"/></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>

            <h4 class="page-heading bottom-indent">Введите характеристики</h4>
            <div class="row">
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Производитель:</td>
                            <td><input class="form-control my-2" type="text" name="manufacturer"/></td>
                        </tr>
                        <tr>
                            <td>Состав:</td>
                            <td><input class="form-control my-2" type="text" name="composition" /></td>
                        </tr>
                        <tr>
                            <td>Тип:</td>
                            <td><input class="form-control my-2" type="text" name="type" /></td>
                        </tr>
                        <tr>
                            <td>Упаковка:</td>
                            <td><input class="form-control my-2" type="text" name="packaging" /></td>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="col-5 md-auto">
                    <table class="table">
                        <thead>
                        <tr>
                            <td>Вес:</td>
                            <td><input class="form-control my-2" type="text" name="weight" /></td>
                        </tr>
                        <tr>
                            <td>Страна производитель:</td>
                            <td><input class="form-control my-2" type="text" name="country" /></td>

                        </tr>
                        <tr>
                            <td>Хранение:</td>
                            <td><input class="form-control my-2" type="text" name="validity" /></td>
                        </tr>
                        <tr>
                            <td>Рекомендуется для приготовления:</td>
                            <td><input class="form-control my-2" type="text" name="recommended" /></td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>

            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="btn btn-dark">Сохранить</button>
        </form>
    </@a.account>
</@c.page>