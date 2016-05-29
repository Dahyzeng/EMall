<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="<%request.getContextPath();%>/store/js/language/zh-CN/chinese_message.js"></script>
<script src="<%request.getContextPath();%>/store/js/language/el/english_message.js"></script>
<div id="header">
    <div class="container_12">
        <div id="top">
            <div class="grid_3">
                <div class="phone_top">
                    <span data-bind="text: headerMessage().callUs"></span> +777 (100) 1234
                </div>
            </div>

            <div class="grid_2" style="margin-top: 13px;">
                <span data-bind="text: currentLanguage"></span>
                <select style="width: 85px;height: 28px" data-bind="options: languageOptions, value: currentLanguageValue, optionsCaption: headerMessage().languageSelect,event:{change: setLanguage}">
                </select>
            </div>

            <div class="grid_7" >
                <div class="welcome" style="float: right">
                    <c:if test="${sessionScope.username eq null}">
                        <span data-bind="text: headerMessage().hello"></span> <a href="/login"><span data-bind="text: headerMessage().login"></span></a> <span data-bind="text: headerMessage().or"></span>
                        <a href="/register"><span data-bind="text: headerMessage().register"></span></a>.
                    </c:if>
                    <c:if test="${sessionScope.username ne null}">
                        <span data-bind="text: headerMessage().welcome"></span>, <a href="/account">${sessionScope.username}</a>&nbsp;&nbsp;<a href="#" data-bind="click: logout"><span data-bind="text: headerMessage().notMe"></span></a>
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
                    <input type="text" name="search" style="float: left; width: 160px" class="entry_form" data-bind="value: searchKey"/>
                    <button style="height: 33px;width: 55px" data-bind="click: search"><span data-bind="text: headerMessage().search"></span></button>
                </form>
            </div>
            <div class="grid_6">
                <ul id="cart_nav">
                    <li>
                        <a class="cart_li" href="#"><span data-bind="text: headerMessage().cart"></span> <span data-bind="text: totalPrice"></span></a>
                        <ul class="cart_cont">
                        <span data-bind="foreach: {data: cartItemArray, as: 'itemMap'}">
                        <li>
                            <a data-bind="attr: {href: '/pdp/' + itemMap.item.itemId}" class="prev_cart">
                                <div class="cart_vert">
                                    <img data-bind="attr: {src: itemMap.item.showPicURL}" alt="" title=""/>
                                </div>
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
                                <a href="/cart" class="view_cart"><span data-bind="text: headerMessage().viewShoppingCart"></span></a>
                                <a href="#" data-bind="click: placeOrderNow" class="checkout"><span data-bind="text: headerMessage().checkout"></span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <nav class="private">
                    <ul>
                        <li><a href="/account"><span data-bind="text: headerMessage().myAccount"></span></a></li>
                        <li class="separator">|</li>
                        <li><a href="/contact_us"><span data-bind="text: headerMessage().contactUs"></span></a></li>
                        <c:if test="${sessionScope.username eq null}">
                            <li class="separator">|</li>
                            <li><a href="/login"><span data-bind="text: headerMessage().login"></span></a></li>
                            <li class="separator">|</li>
                            <li><a href="/register"><span data-bind="text: headerMessage().signUp"></span></a></li>
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
                            <a href="/home"><span data-bind="text: headerMessage().home"></span></a>
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
        self.headerMessage = ko.observable({});
        self.currentLanguage = ko.observable();
        self.searchKey = ko.observable('${requestScope.key}');
        if ('${sessionScope.siteLanguage}' == "chinese") {
            self.headerMessage(chineseMessage);
            self.currentLanguage(chineseMessage["${sessionScope.siteLanguage}"]);
        } else {
            self.headerMessage(englishMessage);
            self.currentLanguage(englishMessage["${sessionScope.siteLanguage}"]);

        }
        self.languageOptions = [self.headerMessage()['english'], self.headerMessage()['chinese']];

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

        self.placeOrderNow = function () {
            $.post("/order/items", {items: JSON.stringify(self.cartItemArray())}, function (json) {
                if (json['success']) {
                    window.location.href = "/checkout";
                }
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
        self.logout = function () {
            $.get("/profile/logout", function () {
                window.location.href = "/login";
            })
        };
        self.search = function () {
            window.location.href = "/search_key/" + self.searchKey();
        };

        (function () {
            $.get("/store/get_categories", function (categoryJson) {
                self.headerCategories(categoryJson);
            });
            getCartItem();
        })();
    }
</script>