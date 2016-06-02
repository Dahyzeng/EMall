<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="shortcut icon" href="images/favicon.html">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <title>Catalog (list type view)</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/html5.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jflow.plus.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/checkbox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/radio.js"></script>
    <script src="<%request.getContextPath();%>/store/js/selectBox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
    <script src="<%request.getContextPath();%>/store/js/language/zh-CN/chinese_message.js"></script>
    <script src="<%request.getContextPath();%>/store/js/language/el/english_message.js"></script>

</head>
<body>
<jsp:include page="common/header.jsp"/>

<div class="container_12">
    <div class="grid_12">
        <div class="breadcrumbs">
            <a href="index.html"><span data-bind="text: itemListMessage().home"></span></a><span>&#8250;</span></span>
            <span class="current">${requestScope.name}</span>
        </div>
        <!-- .breadcrumbs -->
    </div>
    <!-- .grid_12 -->
</div>

<section id="main">
    <div class="container_12">

        <div id="content" class="grid_12">
            <h1 class="page_title"><span data-bind="text: itemListMessage().productList"></span></h1>

            <div class="options">
                <div class="grid-list">
                    <a class="grid" data-bind="attr: { href: gridURL}"><span>img</span></a>
                    <a class="list current" data-bind="attr: { href: listURL}"><span>img</span></a>
                </div>
                <!-- .grid-list -->

                <div class="show">
                    <span data-bind="text: itemListMessage().show"></span>
                    <select name="pageSize" data-bind="options: pageSizeOptions, value: pageSizeValue, optionsCaption: itemListMessage().select">
                    </select>
                    <span data-bind="text: itemListMessage().perPage"></span>
                </div>
                <!-- .show -->

                <div class="sort">
                    <span data-bind="text: itemListMessage().sortBy"></span>
                    <select name="sort" data-bind="options: sortByOptions, value: sortValue, optionsCaption: itemListMessage().select">
                    </select>
                </div>
                <!-- .sort -->
            </div>
            <!-- .options -->

            <div class="listing_product" data-bind="foreach: { data: itemArray, as: 'item'}">
                <div class="product_li">
                    <div class="grid_3">
                        <%--<img class="sale" src="images/new.png" alt="New"/>--%>
                        <div class="prev">
                            <a data-bind="attr: { href: '/pdp/' + item.itemId }">
                                <img data-bind="attr: {src: item.showPicURL, alt: item.itemName, title: item.itemName }"/>
                            </a>
                        </div>
                    </div>
                    <div class="grid_7">
                        <div class="entry_content">
                            <a data-bind="attr: { href: '/pdp/' + item.itemId }">
                                <h3 class="title" data-bind="text: item.itemName"></h3>
                            </a>

                            <%--<div class="review" style="margin-bottom: 4px">--%>
                                <%--<a class="plus" href="#"></a>--%>
                                <%--<a class="plus" href="#"></a>--%>
                                <%--<a class="plus" href="#"></a>--%>
                                <%--<a href="#"></a>--%>
                                <%--<a href="#"></a>--%>
                                <%--<span>1 <span data-bind="text: $root.itemListMessage().review"></span></span>--%>
                            <%--</div>--%>
                            <a class="more" data-bind="attr: { href: '/pdp/' + item.itemId }"><span data-bind="text: $root.itemListMessage().learnMore"></span></a>
                        </div>
                    </div>

                    <div class="grid_2" style="width: 142px">
                        <div class="cart">
                            <div class="price">
                                <!-- ko ifnot: item.discount==0 -->
                                <div class="price_new">$<span data-bind="text: item.price - item.discount"></span></div>
                                <div class="price_old">$<span data-bind="text: item.price"></span></div>
                                <!-- /ko -->
                                <!-- ko if: item.discount==0 -->
                                <div class="price_new">$<span data-bind="text: item.price"></span></div>
                                <!-- /ko -->
                            </div>
                            <a href="#" data-bind="click: $root.addToCart" class="bay"><span data-bind="text: $root.itemListMessage().addToCart"></span></a>
                            <a href="#" data-bind="click: $root.addCompare, attr: {title: $root.itemListMessage().compare}" class="obn"></a>
                            <div style="margin-left: 75px; padding-top: 10px; color: #2AB4C4" data-bind="text: $root.itemListMessage().sale + ': ' + item.saleQuantity"></div>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>

            <div class="pagination">
                <!-- ko if: hasMore -->
                <ul>
                    <li><a href="#" data-bind="click: showMore"><span data-bind="text: $root.itemListMessage().showMore + '  >>'"></span></a></li>
                </ul>
                <!-- /ko -->
                <!-- ko ifnot: hasMore -->
                <ul>
                    <li><a><span data-bind="text: $root.itemListMessage().bottom"></span></a></li>
                </ul>
                <!-- /ko -->
            </div>
        </div>
        <!-- #content -->

        <div class="clear"></div>

    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function listPage() {
        var self = this;
        var type = '${requestScope.type}';
        var id = '${requestScope.id}';
        var name = '${requestScope.name}';

        var messageJson = {
            "Price Up": "priceUp",
            "Price Down": "priceDown",
            "价格(升)": "priceUp",
            "价格(降)": "priceDown",
            "Sale Up": "saleUp",
            "Sale Down": "saleDown",
            "销量(升)": "saleUp",
            "销量(降)": "saleDown",
            "undefined": "undefined"
        };
        self.itemListMessage = ko.observable();
        if ('${sessionScope.siteLanguage}' == 'chinese') {
            self.itemListMessage(chineseMessage);
        } else {
            self.itemListMessage(englishMessage);
        }

        self.sortByOptions = [self.itemListMessage()['priceUp'], self.itemListMessage()['priceDown'], self.itemListMessage()['saleUp'], self.itemListMessage()['saleDown']];
        self.sortValue = ko.observable();
        self.sortValue.subscribe(function (sortValue) {
            if (!sortValue) {
                return;
            }
            self.hasMore(true);
            self.currentPage(1);
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=list&sortValue=" + messageJson[sortValue], function (itemList) {
                self.itemArray(itemList);
            });
        });

        self.pageSizeOptions = [3, 6, 9];
        self.pageSizeValue = ko.observable(${sessionScope.listPageSize});
        self.pageSizeValue.subscribe(function (pageSize) {
            if (pageSize) {
                self.hasMore(true);
                self.currentPage(1);
                $.get("/store/page_size?type=list&pageSize=" + pageSize, function () {
                    $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=list&sortValue=" + messageJson[self.sortValue()], function (itemList) {
                        self.itemArray(itemList);
                    });
                })
            }
        });


        self.categoryIdType = ko.observable();
        self.typeId = ko.observable(id);
        self.currentPage = ko.observable(1);
        self.itemArray = ko.observableArray();


        self.hasMore = ko.observable(true);
        self.showMore = function() {
            self.currentPage(self.currentPage() + 1);
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=list&sortValue=" + messageJson[self.sortValue()], function (itemList) {
                if (itemList.length > 0) {
                    if (self.pageSizeValue() > itemList.length) {
                        self.hasMore(false);
                    }
                    for (var i = 0; i < itemList.length; i ++) {
                        self.itemArray.push(itemList[i]);
                    }
                } else {
                    self.hasMore(false);
                    self.currentPage(self.currentPage() - 1);
                }
            });
        };
        self.addToCart = function(p) {
            $.post("/cart/add", {itemId: p.itemId, quantity: 1}, function(resultJson) {
                if (resultJson['success']) {
                    alert("add success");
                    getCartItem();
                } else {
                    if (resultJson['errorMessage'] == 'no_login') {
                        if (resultJson['url']) {
                            window.location.href = "/login?url=" + resultJson['url'];
                        } else {
                            window.location.href = "/login";
                        }
                    }
                }
            })
        };

        self.addCompare = function(p) {
            $.get("/compare/add?itemId=" + p.itemId, function(result) {
                if (result['success']) {
                    window.location.href = "/compare";
                } else {
                    alert(result['errorMessage']);
                }
            })
        };

        (function() {
            headerPage();
            self.categoryIdType('fatherId=');
            if (type == 'c') {
                self.categoryIdType('categoryId=');
            }
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=list&sortValue=" + messageJson[self.sortValue()], function (itemList) {
                self.itemArray(itemList);
            });
        })();
        self.gridURL = ko.observable('/search/grid?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
        self.listURL = ko.observable('/search/list?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
    }
    ko.applyBindings(new listPage());
</script>
</html>