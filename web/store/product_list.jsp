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

</head>
<body>
<jsp:include page="common/header.jsp"/>

<div class="container_12">
    <div class="grid_12">
        <div class="breadcrumbs">
            <a href="index.html">Home</a><span>&#8250;</span></span>
            <span class="current">${requestScope.name}</span>
        </div>
        <!-- .breadcrumbs -->
    </div>
    <!-- .grid_12 -->
</div>

<section id="main">
    <div class="container_12">

        <div id="content" class="grid_12">
            <h1 class="page_title">Product List</h1>

            <div class="options">
                <div class="grid-list">
                    <a class="grid" data-bind="attr: { href: gridURL}"><span>img</span></a>
                    <a class="list current" data-bind="attr: { href: listURL}"><span>img</span></a>
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
                            <a href="product_page.html">
                                <h3 class="title" data-bind="text: item.itemName"></h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p data-bind="text: item.description"></p>
                            <a class="more" href="product_page.html">Learn More</a>
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
                            <a href="#" data-bind="click: $root.addToCart" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>

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
            <!-- .pagination -->
            <p class="pagination_info">Displaying 1 to 12 (of 100 products)</p>
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
        (function() {
            headerPage();
            self.categoryIdType('fatherId=');
            if (type == 'c') {
                self.categoryIdType('categoryId=');
            }
            $.get("/store/get_item_category?" + self.categoryIdType() + self.typeId() + "&page=" + self.currentPage() + "&pageType=list", function (itemList) {
                self.itemArray(itemList);
            });
        })();
        self.gridURL = ko.observable('/search/grid?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
        self.listURL = ko.observable('/search/list?' + self.categoryIdType() + self.typeId() + '&categoryName=' + name);
    }
    ko.applyBindings(new listPage());
</script>
</html>