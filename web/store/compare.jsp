<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products comparison</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width" style="margin-top: 30px">
    <div class="container_12">
        <div class="grid_12">
            <h1 class="page_title"><span data-bind="text: headerMessage().compareProduct"></span></h1>
            <!-- ko ifnot: isEmpty -->
            <div class="compare">
                <ul class="close_top">
                    <li class="desc width162"></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li><a title="close" class="close" data-bind="click: $root.deleteCompareItem" href="#"></a></li>
                    </span>
                </ul><p style="clear: both;"></p>
                <ul style="border-bottom: 1px solid #a8dade;">
                    <li class="desc width162"><span data-bind="text: headerMessage().productName"></span></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg name" data-bind="text: item.itemName"></li>
                    </span>
                </ul><p style="clear: both;"></p>
                <ul class="images ">
                    <li class="desc width162"><span data-bind="text: headerMessage().image"></span></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg">
                            <a data-bind="attr: {href: '/pdf/' + item.itemId}">
                                <div>
                                    <img data-bind="attr: {src: item.showPicURL}" alt="Product slide 1">
                                </div>
                            </a>
                        </li>
                    </span>
                </ul><p style="clear: both;"></p>
                <ul class="prise">
                    <li class="desc width162"><span data-bind="text: headerMessage().price"></span></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg">
                            <!-- ko ifnot: item.discount==0 -->
                            <div class="price_new">$<span data-bind="text: item.price - item.discount"></span></div>
                            <div class="price_old">$<span data-bind="text: item.price"></span></div>
                            <!-- /ko -->
                            <!-- ko if: item.discount==0 -->
                            <div class="price_new">$<span data-bind="text: item.price"></span></div>
                            <!-- /ko -->
                        </li>
                    </span>
                </ul><p style="clear: both;"></p>
                <%--<ul class="model">--%>
                    <%--<li class="desc width162">Model</li>--%>
                    <%--<li class="bg">Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</li>--%>
                    <%--<li>Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</li>--%>
                    <%--<li class="bg">Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</li>--%>
                <%--</ul>--%>
                <ul class="brand">
                    <li class="desc width162"><span data-bind="text: headerMessage().sale"></span></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg" data-bind="text: item.saleQuantity"></li>
                    </span>
                </ul><p style="clear: both;"></p>
                <ul class="availbility">
                    <li class="desc width162"><span data-bind="text: headerMessage().availability"></span></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg">
                            <!-- ko if: item.inventory !=0 -->
                            <span data-bind="text: headerMessage().inStock"></span>
                            <!-- /ko -->
                            <!-- ko if: item.inventory ==0 -->
                            <span data-bind="text: headerMessage().outOfStock"></span>
                            <!-- /ko -->
                        </li>
                    </span>
                </ul><p style="clear: both;"></p>
                <%--<ul class="rating">--%>
                    <%--<li class="desc width162">Rating</li>--%>
                    <%--<li class="bg">--%>
                        <%--<div class="quality">--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<div class="quality">--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                    <%--<li class="bg">--%>
                        <%--<div class="quality">--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a class="plus" href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                            <%--<a href="#"></a>--%>
                        <%--</div>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<ul class="description">--%>
                    <%--<li class="desc">Description</li>--%>
                    <%--<span data-bind="foreach: {data: itemArray, as: 'item'}">--%>
                        <%--<li class="bg">--%>
                            <%--<p style="text-align: center"><span data-bind="text: item.description"></span></p>--%>
                        <%--</li>--%>
                    <%--</span>--%>
                <%--</ul>--%>
                <p style="clear: both;"></p>
                <ul class="add_cart">
                    <li class="desc"></li>
                    <span data-bind="foreach: {data: itemArray, as: 'item'}">
                        <li class="bg">
                            <button class="add" data-bind="click: $root.addToCart"><span data-bind="text: headerMessage().addToCart"></span></button>
                        </li>
                    </span>
                </ul>
            </div>
            <!-- /ko -->
            <!-- ko if: isEmpty -->
            <div>
                Empty
            </div>
            <!-- /ko -->
        </div>
        <div class="clear"></div>
    </div>
</section>
<div>
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
<script>
    function comparePage() {
        var self = this;
        self.itemArray = ko.observableArray();
        self.isEmpty = ko.observable(true);

        self.deleteCompareItem = function (p) {
            $.get("/compare/delete?itemId=" + p.itemId, function(json) {
                if (json['success']) {
                    self.itemArray.remove(p);
                    if (self.itemArray().length != 0) {
                        self.isEmpty(false);
                    } else {
                        self.isEmpty(true);
                    }
                }
            })
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
        (function () {
            headerPage();
            $.get("/compare/get", function (itemList) {
                self.itemArray(itemList);
                if (self.itemArray().length != 0) {
                    self.isEmpty(false);
                } else {
                    self.isEmpty(true);
                }
            });
        })();
    }
    ko.applyBindings(new comparePage());
</script>
</html>
