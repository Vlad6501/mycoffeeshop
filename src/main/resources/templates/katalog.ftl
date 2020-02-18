<#import 'parts/navbar.ftl' as c>

<@c.page>
    <h1 class="h3 mb-3 text-center">Каталог</h1>
    <div class="row">
        <form action="/katalog/" method="post"></form>
        <div class="card mx-2" style="width: 16rem;">
            <a href="/katalog/coffee" title="Кофе" class="img">
                <img class="card-img-top" src="/img/Coffee-Roster-grade.jpg" alt="" width="125" height="175">
            </a>
            <div class="card-body">
                <h4 class="page-heading bottom-indent">Кофе</h4>
            </div>
        </div>
        <div class="card mx-2" style="width: 16rem;">
            <a href="/katalog/coffeemachines" title="Кофемашины" class="img">
                <img class="card-img-top" src="/img/DSC00480.jpg" alt="" width="125" height="175">
            </a>
            <div class="card-body">
                <h4 class="page-heading bottom-indent">Кофемашины</h4>
            </div>
        </div>
        <div class="card mx-2" style="width: 16rem;">
            <a href="/katalog/coffeegrinders" title="Кофемолки" class="img">
                <img class="card-img-top" src="/img/1570_big.jpg" alt="" width="125" height="175">
            </a>
            <div class="card-body">
                <h4 class="page-heading bottom-indent">Кофемолки</h4>
            </div>
        </div>
        <div class="card mx-2" style="width: 16rem;">
            <a href="/katalog/accessories" title="Аксессуары" class="img">
                <img class="card-img-top" src="/img/aksessuary-dlya-kofemashin-kofe-i-chaya-coffee-shop-net-ua.jpg" alt="" width="125" height="175">
            </a>
            <div class="card-body">
                <h4 class="page-heading bottom-indent">Аксессуары</h4>
            </div>
        </div>
        </form>
    </div>
</@c.page>