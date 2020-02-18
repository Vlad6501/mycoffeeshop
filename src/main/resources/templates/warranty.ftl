<#import 'parts/navbar.ftl' as c>

<@c.page>
    <h1 class="h3 mb-3 text-center">О нас</h1>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Главная</a></li>
            <li class="breadcrumb-item active" aria-current="page">Гарантия и качество товара</li>
        </ol>
    </nav>
    <div class="col-lg-12 col-md-12"><div class="page-title-wrapper">
            <h1 class="page-title">
                <span class="base" data-ui-id="page-title-wrapper">Гарантия и качество товара</span>    </h1>
        </div>
        <div class="page messages"><div data-placeholder="messages"></div><div data-bind="scope: 'messages'">
                <div data-bind="foreach: { data: cookieMessages, as: 'message' }" class="messages"></div>
                <div data-bind="foreach: { data: messages().messages, as: 'message' }" class="messages"></div>
            </div>

        </div><div class="column main"><input name="form_key" type="hidden" value="S2suc1ovepVxDzKa"><div id="authenticationPopup" data-bind="scope:'authenticationPopup'" style="display: none;">
                <script>
                    window.authenticationPopup = {"customerRegisterUrl":"https:\/\/coffee-shop.net.ua\/customer\/account\/create\/","customerForgotPasswordUrl":"https:\/\/coffee-shop.net.ua\/customer\/account\/forgotpassword\/","baseUrl":"https:\/\/coffee-shop.net.ua\/"};
                </script>
                <!-- ko template: getTemplate() -->



                <!-- /ko -->

            </div>


            <script>
                function _SmQuickView(){
                    var $ = (typeof $ !== 'undefined') ? $ : jQuery.noConflict();
                    var	pathbase = 'quickview/index/index',
                        _item_cls = $('.products-grid .item .item-inner .box-image .bottom-action-out .bottom-action, .products-list .item .item-inner .box-info-list .bottom-action , .sm-dealsslider .ds-items-detail .dealsslider-content .product-item-actions'),
                        _item_cls_show_button = $('.products-grid .item .item-inner .box-image .bottom-action-out .bottom-action, .products-list .item .item-inner .box-info-list .bottom-action , .sm-dealsslider .ds-items-detail .dealsslider-content .product-item-actions'),
                        _base_url = 'https://coffee-shop.net.ua/';
                    var baseUrl = _base_url + pathbase;
                    var _arr = [];
                    if(_item_cls.length > 0 && _item_cls_show_button.length > 0){
                        _item_cls.each(function() {
                            var $this = $(this);
                            if($this.parent().parent().find("a.sm_quickview_handler").length <= 0) {
                                if( $this.find('a').length > 0 ){
                                    var _href =	(typeof $($this.find('a')[0]).attr('href') !== 'undefined' && $($this.find('a')[0]).attr('href').replace(_base_url,"") == '#') ? $($this.parent().find('a')[0]) : $($this.find('a')[0]);
                                    if(typeof _href.attr('href') !== 'undefined'){
                                        var	producturlpath = _href.attr('href').replace(_base_url,"");
                                        producturlpath = ( producturlpath.indexOf('index.php') >= 0 ) ? producturlpath.replace('index.php/','') : producturlpath;
                                        var	reloadurl = baseUrl+ ("/path/"+producturlpath).replace(/\/\//g,"/"),
                                            _quickviewbutton = "<a class='sm_quickview_handler btn-action' title='Быстрый просмотр' href='"+reloadurl+"'></a>";
                                        _arr.push(_quickviewbutton);
                                    }
                                }
                            }
                        });
                        var count = 0 ;
                        _item_cls_show_button.each(function () {
                            if(typeof _arr[count] != 'undefined' && $(this).find("a.sm_quickview_handler").length <= 0)
                            {
                                $(this).append(_arr[count]);
                                count ++;
                            }
                        });
                        _SmFancyboxView();
                    }
                }

                function _SmFancyboxView(){
                    var $ = (typeof $ !== 'undefined') ? $ : jQuery.noConflict();
                    $('.sm_quickview_handler').fancybox({
                        width : '1000px',
                        height : '600px',
                        autoSize       :  0,
                        title          : 'null',
                        scrolling      : 'auto',
                        type           : 'ajax',
                        ajax :{
                            dataType : 'json',
                            headers  : { 'X-fancyBox': true }

                        },
                        openEffect     : 'none',
                        closeEffect    : 'none',
                        helpers        :{
                            title:  null,
                            overlay : {
                                showEarly : true
                            }
                        },
                        beforeLoad: function(){

                        },
                        afterLoad:function(){
                            var _current =  'https://coffee-shop.net.ua/warranty/';
                            // if(typeof $('.fotorama-item').data('fotorama') !== 'undefined'){
                            // 	$('.fotorama-item').data('fotorama').destroy();
                            // 	$('.fotorama-item').remove();
                            // }
                            if(typeof this.content.sucess !== 'undefined' && this.content.sucess == true){
                                var _title = '<div class="smqv-title"><h1>'+this.content.title+'</h1></div>', _content = this.content.item_mark ;
                                this.inner.html('<div id="sm_quickview" class="sm-quickview">'+_title+_content+'</div>');

                                $('#sm_quickview .action.tocompare').on('click', function(e){
                                    setTimeout(function(){
                                        window.location.href = _current;
                                    },1000);
                                });
                            }
                        },
                        beforeShow : function(){
                            var _bundle_slide	=  $('#bundle-slide');
                            if(_bundle_slide.length){
                                _bundle_slide.on('click', function(){
                                    $('.fancybox-inner').addClass('smqv-height-content');
                                    var  _bundleOptionsContainer = $('.bundle-options-container .product-add-form');
                                    _bundleOptionsContainer.show();
                                    $('html, body, .fancybox-wrap').animate({
                                        scrollTop: _bundleOptionsContainer.offset().top
                                    }, 600);
                                });
                            }

                        },
                        afterShow : function(){
                            if($('#quickview-gallery-placeholder').length){
                                $('#quickview-gallery-placeholder').removeClass('gallery-loading');
                            }


                        },
                        beforeChange: function(){

                        },
                        beforeClose: function(){
                            // if(typeof $('.fotorama-item').data('fotorama') !== 'undefined'){
                            // 	$('.fotorama-item').css({'display':'none'}).clone().appendTo('body');
                            // 	$('.fotorama-item').data('fotorama',$('.fotorama-item').data('fotorama'));
                            // }
                        },
                        afterClose:function(){

                        }
                    });
                }
            </script>


            <script type="text/javascript">
                //<![CDATA[
                jQuery(document).ready(function ($) {
                    _SmQuickView();
                });
                //]]>
            </script><h3>На какие товары предоставляется гарантия?</h3>
            <p style="text-align: justify;">&nbsp;</p>
            <p>Гарантия может быть представлена производителем, либо интернет-магазином «Coffee Shop». Подтверждением гарантийных обязательств, служит гарантийный талон производителя или гарантийный талон магазина «Coffee Shop».</p>
            <p>Срок гарантии указан в описании каждого товара на сайте. Гарантия предоставляется на срок:<br><strong></strong></p>
            <p><strong>- кофемашины и кофемолки б/у</strong>&nbsp;– 6 месяцев;</p>
            <p>- <strong>остальное оборудование б/у</strong> –&nbsp;1 месяц;<strong></strong></p>
            <p><strong>- новые кофемашины и кофемолки</strong>&nbsp;– от 12 до 24 месяцев, в зависимости от модели товара.</p>
            <p>Гарантийным обслуживанием нового оборудования занимаются сервисные центры, авторизованные производителями.</p>
            <p>Гарантийным обслуживанием б/у оборудования занимается наш главный сервисный центр, который находится в Ужгороде. Возможно также обслужить кофейное оборудование у наших партнерских сервисных центрах, которые находятся в следующих городах: Киев, Одесса, Днепропетровск.</p>
            <p style="text-align: justify;">&nbsp;</p>
            <h3>Качество товара</h3>
            <p style="text-align: justify;">&nbsp;</p>
            <p>Все новое оборудование имеет сертификат, что подтверждает 100% качественный товар.&nbsp;</p>
            <p>Кофейное оборудование (кофемашины и кофемолки) бывшее в эксплуатации проходит специальную предпродажную сервисную подготовку.</p>
            <p>Что входит в подготовку?</p>
            <p>- разборка оборудования под ноль</p>
            <p>- декальцинация всех медных деталей</p>
            <p>- замена расходников и прокладок</p>
            <p>- при необходимости, замена помпы (насоса) или мотора, для кофемолок - ножей</p>
            <p>- покраска и полировка</p>
            <p>- тестирование и настройка</p>
            <p>Таким образом потребитель получает оборудование б/у надлежащего качества, что дает возможность эксплуатировать данный товар, как новый.</p>
            <p style="text-align: justify;">&nbsp;</p>
            <h3>В каких случаях гарантия не предоставляется?</h3>
            <p style="text-align: justify;">&nbsp;</p>
            <p>Сервисный центр может отказать в гарантийном ремонте в случае:</p>
            <ul>
                <li>- нарушения сохранности гарантийных пломб;</li>
                <li>- наличия механических или иных повреждений, возникших вследствие умышленных или неосторожных действий покупателя или третьих лиц;</li>
                <li>- нарушение правил использования;</li>
                <li>- несанкционированного вскрытия, ремонта или изменения внутренних коммуникаций и компонентов товара, изменения конструкций или схемы товара;</li>
                <li>- неправильного заполнения гарантийного талона;</li>
                <li>- если серийный номер или MAC адрес, находящиеся в памяти изделия, изменены, стёрты или не могут быть установлены;</li>
            </ul>
            <p></p>
            <p>Гарантийные обязательства не распространяются на следующие неисправности:</p>
            <ul>
                <li>- случайные повреждения (дефекты причинённые клиентом);</li>
                <li>- повреждения в результате стихийных бедствий (природных явлений);</li>
                <li>- повреждения, возникшие вследствие небрежного отношения или использования (несоблюдение емпературного режима, воздействие жидкости, запыленности, механические повреждения, попадание внутрь корпуса посторонних предметов);</li>
                <li>- повреждения, вызванные аварийным повышением или понижением напряжения в сети;</li>
                <li>- повреждения, вызванные неправильным подключением к электросети;</li>
                <li>- повреждения, вызванные дефектами системы, в которой использовался данный товар, или возникшие в результате соединения и подключения товара к другим изделиям;</li>
                <li>- повреждения, вызванные использованием товара не по назначению или с нарушением правил эксплуатации.</li>
            </ul>
            <p></p>
            <p>Пожалуйста, проверьте комплектность и отсутствие дефектов в товаре при его получении.</p></div></div>
</@c.page>