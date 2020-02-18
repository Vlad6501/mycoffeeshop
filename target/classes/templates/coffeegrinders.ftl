<#import 'parts/navbar.ftl' as c>
<#import 'parts/product.ftl' as p>
<#import 'parts/pager.ftl' as g>

<@c.page>
    <@p.product>
    <h1 class="h3 mb-3 text-center">Кофемолки</h1>
    <div class="col-md-auto">
        <p style="text-align: justify;">
            <img style="float: left; margin: 5px;" src="/img/1570_big.jpg" alt="" width="240">
            Неотъемлемой частью нащей жизни является бодрящий напиток под названиемкофе. И если задать вопрос: «какой бывает кофе» любому человеку, первый ответ будет «итальянский», второй – «горячий», и последующие: «бразильский, вкусный, с молоком» и так далее.
        </p>
        <p>Существуют разные производители кофе, дешевые и дорогие. Все зависит от происхождения зерна, качества обжарки, упаковки и методов купажирования. Мы привыкли покупать те фирмы, которые слышали и знаем, доверяем им. Но есть производители которые не тратят большие деньги на рекламу, а вкладывают свое времья и труд в качество кофе.</p>
        <p>            Разрезнят несколько типов упаковок и выдов кофе для кофемашин: кофе в зернах, молотый кофе, кофе без кофеина, кофе в чалдах и капсулах, ароматизированный кофе, а также кофейные зерна в шоколаде. Продажа кофе свежей обжарки Mokasol, Molinari, Lavazza, Blaser, Segafredo, Pera, моносорта арабики, спешиалти бленды, кофе робуста. Элитные сорта кофе купить‎ для рожковой кофеварки будет правильным выбором. Наслаждайтесь и покупайте кофе – напиток богов. Мы предлагаем только лучшие сорта кофе, быструю доставку по Киеву и Украине. В интернет-магазине Coffee Shop можно купить кофе оптом и в розницу.</p>
    </div>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Главная</a></li>
                <li class="breadcrumb-item"><a href="/katalog">Каталог</a></li>
                <li class="breadcrumb-item active" aria-current="page">Кофемолки</li>
            </ol>
        </nav>
        <nav class=" shadow bg-white rounded pt-2 pb-3 pb-md-2">
            <div class="container d-flex align-items-md-center py-2">
                <nav class="nav mx-auto">
                    <a class="text-dark py-1 mr-3" href="/katalog/coffeegrinders/professional">Профессиональные</a>
                    <a class="text-dark py-1 mr-3" href="/katalog/coffeegrinders/household">Бытовые</a>
                    <a class="text-dark py-1 mr-3" href="/katalog/coffeegrinders/manual">Ручные</a>
                </nav>
            </div>
        </nav>
    </@p.product>
    <@g.pager url page />
</@c.page>