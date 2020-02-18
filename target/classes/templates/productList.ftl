<#import 'parts/navbar.ftl' as c>
<#import 'parts/account.ftl' as a>

<@c.page>
    <@a.account>
        <form action="/account/productList" method="get">
            <h4 class="page-heading bottom-indent">Список товаров</h4>
            <a href="/account/productList/newProduct" class="btn btn-dark my-2" role="button">Добавить</a>

            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">ProductName</th>
                    <th scope="col">Category</th>
                    <th scope="col">Section</th>
                    <th scope="col">Price</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Specification</th>
                    <th scope="col">Number</th>
                    <th scope="col">File</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <thead>
                <#list productList as product>
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.productName}</td>
                        <td>${product.category}</td>
                        <td>${product.section}</td>
                        <td>${product.price}</td>
                        <td>${product.discount}</td>
                        <td>${product.specification}</td>
                        <td>${product.number}</td>
                        <td>${product.filename}</td>
                        <td><a href="/account/productList/${product.id}" class="btn-sm btn-dark" role="button">Изменить</a></td>
                        <td><a href="/account/productList/delete/${product.id}" class="btn-sm btn-dark" role="button">Удалить</a></td>
                    </tr>
                </#list>
                </thead>
            </table>
        </form>
    </@a.account>
</@c.page>