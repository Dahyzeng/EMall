<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalog (grid view)</title>

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

    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>

</head>
<body>
<jsp:include page="common/header.jsp"/>

<div class="container_12">
    <div class="grid_12">
        <div class="breadcrumbs">
            <a href="index.html"><span data-bind="text: itemListMessage().home"></span></a><span>&#8250;</span>
            <span class="current" data-bind="text: itemListMessage().search"></span><span>&#8250;</span>
            <span class="current">${requestScope.key}</span>
        </div>
    </div>
</div>

<section id="main">
    <div class="container_12">

        <div id="content" class="grid_12">
            <h1 class="page_title"><span data-bind="text: itemListMessage().productList"></span></h1>

            <div class="options">
                <div class="grid-list">
                    <a class="grid current" data-bind="attr: { href: gridURL}"><span>img</span></a>
                    <a class="list" data-bind="attr: { href: listURL}"><span>img</span></a>
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

            <div class="grid_product" data-bind="foreach: { data: itemArray, as: 'item'}">
                <div class="grid_3 product" style="width: 22%">
                    <div class="prev">
                        <a data-bind="attr: { href: '/pdp/' + item.itemId }">
                            <img data-bind="attr: {src: item.showPicURL, alt: item.itemName, title: item.itemName }"/>
                        </a>
                    </div>
                    <h3 class="title" data-bind="text: item.itemName"></h3>

                    <div class="cart">
                        <div class="price">
                            <div class="vert">
                                <!-- ko ifnot: item.discount==0 -->
                                <div class="price_new">$<span data-bind="text: item.price - item.discount"></span></div>
                                <div class="price_old">$<span data-bind="text: item.price"></span></div>
                                <!-- /ko -->
                                <!-- ko if: item.discount==0 -->
                                <div class="price_new">$<span data-bind="text: item.price"></span></div>
                                <!-- /ko -->
                            </div>
                            <div class="vert" style="padding-left: 20px">
                                <span data-bind="text: $root.itemListMessage().sale"></span>
                                <span data-bind="text: item.saleQuantity">
                                </span>
                            </div>
                        </div>
                        <a href="#" data-bind="click: $root.addCompare, attr: {title: $root.itemListMessage().compare}" class="obn"></a>
                        <a href="#" data-bind="click: $root.addToCart, attr: {title: $root.itemListMessage().addToCart}" class="bay"></a>
                    </div>
                </div>

            </div>

            <div class="clear"></div>

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

        <div class="clear"></div>

    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function gridPage() {
        var self = this;
        var key = '${requestScope.key}';
        self.itemArray = ko.observableArray();
        self.currentPage = ko.observable(1);
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
            $.get("/store/find/" + key + "?page=1&type=grid&orderBy=" + messageJson[sortValue], function (itemList) {
                self.itemArray(itemList);
            });
        });

        self.pageSizeOptions = [4, 8, 12];
        self.pageSizeValue = ko.observable(${sessionScope.gridPageSize});
        self.pageSizeValue.subscribe(function (pageSize) {
            if (pageSize) {
                self.hasMore(true);
                self.currentPage(1);
                $.get("/store/page_size?type=grid&pageSize=" + pageSize, function () {
                    $.get("/store/find/" + key + "?page=1&type=grid&orderBy=" + messageJson[self.sortValue()], function (itemList) {
                        self.itemArray(itemList);
                    });
                })
            }
        });

        self.hasMore = ko.observable(true);
        self.showMore = function() {
            self.currentPage(self.currentPage() + 1);
            $.get("/store/find/" + key + "?page=" + self.currentPage() + "&type=grid&orderBy=" + messageJson[self.sortValue()], function (itemList) {
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
            $.get("/store/find/" + key + "?page=1&type=grid", function (itemList) {
                self.itemArray(itemList);
            })
        })();
        self.gridURL = ko.observable('');
        self.listURL = ko.observable('');
    }
    ko.applyBindings(new gridPage());
</script>
</html>