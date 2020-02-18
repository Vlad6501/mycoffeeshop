<#include "security.ftl">
<#import "login.ftl" as l>
<#import "product.ftl" as p>

<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Coffeeshop</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <a class="navbar-brand" href="/">
            <img src="https://coffeum.ua/image/cache/catalog/xStarbucks-Logo-64x64.png.pagespeed.ic.KTyDIbi2XP.png" width="30" height="30" class="d-inline-block align-top" alt=""/>
            <span class="ml-1">COFFEESHOP</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto pt-3 pt-lg-0">
                <li class="nav-item ">
                    <a class="nav-link" href="/katalog">Каталог </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/aboutUs">О нас </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/discount">Акции! </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/delivery">Оплата и доставка </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/contact">Контакты </a>
                </li>
            </ul>
            <ul class="navbar-nav pb-3 pb-lg-0">
                <#if chek>
                    <li class="nav-item">
                        <a class="nav-link" href="/account">${name}</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/registration">Регистрация </a>
                    </li>
                    <@l.logout />
                </#if>
                <#if !chek>
                    <li class="nav-item ">
                        <a class="nav-link" href="/registration">Регистрация </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Войти</a>
                    </li>
                </#if>
            </ul>
        </div>
    </nav>
    <main role="main">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item carousel-item-next carousel-item-left">
                    <img src="/img/article_1386409512_kofe.jpg" style="height: 343px;"/>
                </div>
                <div class="carousel-item active">
                    <img src="/img/xbackgrounds_coffee_beans.jpg.pagespeed.ic.OqUgBoyc4U.jpg"  style="height: 343px;"/>
                </div>
                <div class="carousel-item carousel-item-left">
                    <img src="/img/IMG_4857_logo.jpg" alt="Magister F 2006 HP Multiboiler HG 3GR" style="height: 343px;"/>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <nav class=" shadow bg-white rounded pt-2 pb-3 pb-md-2">
            <div class="container d-flex align-items-md-center py-2">
                <nav class="nav mx-auto">
                    <a class="text-dark py-1 mr-3" href="/katalog/coffee">Кофе</a>
                    <a class="text-dark py-1 mr-3" href="/katalog/coffeemachines">Кофемашины</a>
                    <a class="text-dark py-1 mr-3" href="/katalog/coffeegrinders">Кофемолки</a>
                    <a class="text-dark py-1 mr-3" href="/katalog/accessories">Аксессуары</a>
                </nav>
            </div>
        </nav>
        <div class="container col-md-10 my-3">
            <#nested>
        </div>
        <footer class="container-fluid py-4 bg-dark">
            <div class="row">
                <div class="footer-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 ft-information">
                                        <div class="block ft-my-account">
                                            <div class="d-block mb-3 text-muted"><h5>Компания</h5></div>
                                            <div class="content">
                                                <ul>
                                                    <li><a class="d-block mb-3 text-muted" title="О нас" href="/aboutUs">О нас</a></li>
                                                    <li><a class="d-block mb-3 text-muted" title="Контакты" href="/contact">Контакты</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 ft-my-account">

                                        <div class="block ft-information">
                                            <div class="d-block mb-3 text-muted"><h5>Информация</h5></div>
                                            <div class="content">
                                                <ul>
                                                    <li><a class="d-block mb-3 text-muted" title="Оплата и доставка" href="/delivery">Оплата и доставка</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 popular-footer">
                                        <div class="block">
                                            <div class="d-block mb-3 text-muted"><h5>Помощь</h5></div>
                                            <div class="content">
                                                <ul>
                                                    <li><a class="d-block mb-3 text-muted" title="Гарантия" href="/warranty">Гарантия</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">

                                <div class="block ft-contact-us">
                                    <div class="d-block mb-3 text-muted"><h5>Контакты</h5></div>
                                    <div class="content">
                                        <p class="address" style="color: grey"><span>Адрес: </span><a>Киев, Киевская обл., Украина</a></p>
                                        <p class="email" style="color: grey"><span>Написать нам: </span><a>coffeeshop@gmail.com</a></p>
                                        <p class="phone" style="color: grey"><span>Телефон: </span><strong>+380 (68) 78-79-567</strong></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-auto">
                <small class="d-block mb-3 text-muted">© 2020 Интернет-магазин "CoffeeShop". Все права защищены.</small>
            </div>
        </footer>
    </main>
</header>
</body>
</html>
</#macro>