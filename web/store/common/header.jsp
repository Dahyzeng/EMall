<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<%request.getContextPath();%>/store/js/language/zh-CN/headerData.js"></script>
<script src="<%request.getContextPath();%>/store/js/language/el/headerData.js"></script>
<div id="header">
    <div class="container_12">
        <div id="top">
            <div class="grid_3">
                <div class="phone_top">
                    <span data-bind="text: headerTextData().callUs"></span> +777 (100) 1234
                </div>
            </div>

            <div class="grid_2" style="margin-top: 13px;">
                <span data-bind="text: currentLanguage"></span>
                <select style="width: 85px;height: 28px" data-bind="options: languageOptions, value: currentLanguageValue, optionsCaption: headerTextData().languageSelect,event:{change: setLanguage}">
                </select>
            </div>

            <div class="grid_7" >
                <div class="welcome" style="float: right">
                    <c:if test="${sessionScope.username eq null}">
                        <span data-bind="text: headerTextData().hello"></span> <a href="/login"><span data-bind="text: headerTextData().login"></span></a> <span data-bind="text: headerTextData().or"></span>
                        <a href="/register"><span data-bind="text: headerTextData().register"></span></a>.
                    </c:if>
                    <c:if test="${sessionScope.username ne null}">
                        <span data-bind="text: headerTextData().welcome"></span>, <a href="/account">${sessionScope.username}</a>&nbsp;&nbsp;<a href="#" data-bind="click: logout"><span data-bind="text: headerTextData().notMe"></span></a>
                    </c:if>
                </div>
            </div>

        </div>

        <header id="branding">
            <div class="grid_3">
                <hgroup>
                    <h1 id="site_logo">
                        <a href="/home" title="">
                            <img src="<%request.getContextPath();%>/store/images/logo.png"
                                 alt="Online Store Theme Logo"/></a></h1>

                    <h2 id="site_description">Online Store Theme</h2>
                </hgroup>
            </div>
            <div class="grid_3">
                <form class="search">
                    <input type="text" name="search" class="entry_form" value=""
                           placeholder="Search entire store here..."/>
                </form>
            </div>
            <div class="grid_6">
                <ul id="cart_nav">
                    <li>
                        <a class="cart_li" href="#"><span data-bind="text: headerTextData().cart"></span> <span data-bind="text: totalPrice"></span></a>
                        <ul class="cart_cont">
                        <span data-bind="foreach: {data: cartItemArray, as: 'itemMap'}">
                        <li>
                            <a data-bind="attr: {href: '/pdp/' + itemMap.item.itemId}" class="prev_cart">
                                <div class="cart_vert"><img data-bind="attr: {src: itemMap.item.showPicURL}" alt=""
                                                            title=""/></div>
                            </a>

                            <div class="cont_cart">
                                <h4><span data-bind="text: itemMap.item.itemName"></span></h4>

                                <div class="price"><span
                                        data-bind="text: 'x ' + itemMap.quantity + '  $' + itemMap.item.price"></span>
                                </div>
                            </div>
                            <a title="close" data-bind="click: headerDeleteItem" class="close" href="#"></a>

                            <div class="clear"></div>
                        </li>
                        </span>
                            <li class="no_border">
                                <a href="/cart" class="view_cart">View shopping cart</a>
                                <a href="checkout.html" class="checkout">Procced to Checkout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <nav class="private">
                    <ul>
                        <li><a href="/account"><span data-bind="text: headerTextData().myAccount"></span></a></li>
                        <li class="separator">|</li>
                        <li><a href="/contact_us"><span data-bind="text: headerTextData().contactUs"></span></a></li>
                        <c:if test="${sessionScope.username eq null}">
                            <li class="separator">|</li>
                            <li><a href="/login"><span data-bind="text: headerTextData().login"></span></a></li>
                            <li class="separator">|</li>
                            <li><a href="/register"><span data-bind="text: headerTextData().signUp"></span></a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>

        </header>

    </div>

    <div class="clear"></div>
    <div id="block_nav_primary">
        <div class="container_12">
            <div class="grid_12">
                <nav class="primary">
                    <ul>
                        <li class="curent">
                            <a href="/home"><span data-bind="text: headerTextData().home"></span></a>
                        </li>
                    <span data-bind="foreach: { data: headerCategories, as: 'category'}">
                        <li>
                            <a data-bind="attr: {href: '/search/grid?fatherId=' + category.categoryId + '&categoryName=' + category.fatherCategoryName }">
                                <span data-bind="text: category.fatherCategoryName"></span>
                            </a>
                            <ul class="sub" data-bind="foreach: { data: category.childCategory, as: 'childCategory'}">
                                <li>
                                    <a data-bind="attr: { href:  '/search/grid?categoryId=' + childCategory.categoryId + '&categoryName=' + childCategory.categoryName }">
                                        <span data-bind="text: childCategory.categoryName"></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </span>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script>
    function getCartItem() {
        $.get("/cart/getAll", function (resultJson) {
            if (resultJson['success']) {
                self.cartItemArray(resultJson['itemList']);
                self.totalPrice('$' + resultJson['totalPrice']);
            }
        });
    }
    function headerPage() {
        var self = this;
        var json = {Chinese: "chinese", English: "english", 中文: "chinese", 英文: "english"};
        self.headerTextData = ko.observable({});
        self.currentLanguage = ko.observable();
        if ('${sessionScope.siteLanguage}' == "chinese") {
            self.headerTextData(headerChineseKey);
            self.currentLanguage(headerChineseKey["${sessionScope.siteLanguage}"]);
        } else {
            self.headerTextData(headerEnglishKey);
            self.currentLanguage(headerEnglishKey["${sessionScope.siteLanguage}"]);

        }
        self.languageOptions = [self.headerTextData()['english'], self.headerTextData()['chinese']];

        self.currentLanguageValue = ko.observable();

        self.setLanguage = function () {
            var language = self.currentLanguageValue();
            if (!language) {
                return;
            }
            $.get("/store/language?language=" + json[language], function () {
                window.location.reload();
            })
        };

        self.headerCategories = ko.observableArray();
        self.cartItemArray = ko.observableArray();
        self.totalPrice = ko.observableArray();
        self.headerDeleteItem = function (p) {
            $.get("/cart/delete?itemId=" + p.item.itemId, function (resultJson) {
                if (resultJson['success']) {
                    self.cartItemArray.remove(p);
                    self.message('');
                } else {
                    self.message(resultJson['errorMessage']);
                }
            });
        };
        self.changeLanguage = function (p) {

        };
        self.logout = function () {
            $.get("/profile/logout", function () {
                window.location.href = "/login";
            })
        };
        (function () {
            $.get("/store/get_categories", function (categoryJson) {
                self.headerCategories(categoryJson);
            });
            getCartItem();
        })();
    }
</script>