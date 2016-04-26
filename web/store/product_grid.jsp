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
            <a href="index.html">Home</a><span>&#8250;</span>
            <span class="current">${requestScope.name}</span>
        </div>
    </div>
</div>

<section id="main">
    <div class="container_12">

        <div id="content" class="grid_12">
            <h1 class="page_title">Product List</h1>

            <div class="options">
                <div class="grid-list">
                    <a class="grid current" data-bind="attr: { href: gridURL}"><span>img</span></a>
                    <a class="list" data-bind="attr: { href: listURL}"><span>img</span></a>
                </div>
                <!-- .grid-list -->

                <div class="show">
                    Show
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>

                    per page
                </div>
                <!-- .show -->

                <div class="sort">
                    Sort By
                    <select>
                        <option>Position</option>
                        <option>Price</option>
                        <option>Rating</option>
                        <option>Name</option>
                    </select>

                    <a class="sort_up" href="#">&#8593;</a>
                </div>
                <!-- .sort -->
            </div>
            <!-- .options -->

            <div class="grid_product" data-bind="foreach: { data: itemArray, as: 'item'}">
                <div class="grid_3 product" style="width: 22%">
                    <div class="prev">
                        <a data-bind="attr: { href: '/pdf/' + item.itemId }">
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
                                sale:
                                <span data-bind="text: item.saleQuantity">
                                </span>
                            </div>
                        </div>
                        <a href="#" class="like"></a>
                        <a href="#" data-bind="click: $root.addToCart" title="Add to cart" class="bay"></a>
                    </div>
                </div>

            </div>

            <div class="clear"></div>

            <div class="pagination">
                <!-- ko if: hasMore -->
                <ul>
                    <li><a href="#" data-bind="click: showMore">Show More >></a></li>
                </ul>
                <!-- /ko -->
                <!-- ko ifnot: hasMore -->
                <ul>
                    <li><a>At the bottom.</a></li>
                </ul>
                <!-- /ko -->
            </div>
        </div>
        <!-- #content -->

        <div class="clear"></div>

    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function gridPage() {
        var self = this;
        var type = '${requestScope.type}';
        var id = '${requestScope.id}';
        var name = '${requestScope.name}';

        self.categoryIdType = ko.observable();
        self.typeId = ko.observable(id);
        self.currentPage = ko.observable(1);
        self.itemArray = ko.observableArray();
        self.hasMore = ko.observable(true);
        self.showMore = function() {
            self.currentPage(self.currentPage() + 1);
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=grid", function (itemList) {
                if (itemList.length > 0) {
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
        (function() {
            headerPage();
            self.categoryIdType('fatherId=');
            if (type == 'c') {
                self.categoryIdType('categoryId=');
            }
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=grid", function (itemList) {
                self.itemArray(itemList);
            });

        })();
        self.gridURL = ko.observable('/search/grid?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
        self.listURL = ko.observable('/search/list?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
    }
    ko.applyBindings(new gridPage());
</script>
</html>