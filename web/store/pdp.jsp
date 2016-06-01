<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product view</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%request.getContextPath();%>/store/css/jquery.jqzoom.css" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/html5.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jflow.plus.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/checkbox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/radio.js"></script>
    <script src="<%request.getContextPath();%>/store/js/selectBox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.jqzoom-core.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
   
    <script>
        $(document).ready(function() {
            $('#wrapper_tab a').click(function() {
                if ($(this).attr('class') != $('#wrapper_tab').attr('class')) {
                    $('#wrapper_tab').attr('class', $(this).attr('class'));
                }
                return false;
            });
        });
    </script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main">
    <div class="container_12">
        <!-- .sidebar -->
        <div id="content" class="grid_12">
            <h1 class="page_title"><span data-bind="text: headerMessage().itemDetail"></span></h1>

            <div class="product_page">
                <div class="grid_4 img_slid" id="products">
                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a data-bind="attr: { href: currentShowPicURL }">
                                <img data-bind="attr: { src: currentShowPicURL }" style="width:294px; height:294px" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <ul data-bind="foreach: {data: itemPicArray, as: 'pic'}" class="pagination clearfix">
                        <li>
                            <a href="#" data-bind="click: $root.changeShowPic">
                                <img data-bind="attr: { src: pic.picURL}"/>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="grid_7">
                    <div class="entry_content">
                        <div class="review">
                            <span data-bind="text: headerMessage().grade"></span>
                            <span data-bind="text: averageLevel"></span>
                        </div>
                        <p><span data-bind="text: itemDetail().itemName"></span></p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    <span data-bind="text: headerMessage().availability"></span>:
                                    <!-- ko if: itemDetail().inventory !=0 -->
                                    <span data-bind="text: headerMessage().inStock"></span>
                                    <!-- /ko -->
                                    <!-- ko if: itemDetail().inventory ==0 -->
                                    <span data-bind="text: headerMessage().outOfStock"></span>
                                    <!-- /ko -->
                                </div>
                            </div>
                            <div class="price">
                                <!-- ko ifnot: itemDetail().discount==0 -->
                                <div class="price_new">$<span data-bind="text: itemDetail().price - itemDetail().discount"></span></div>
                                <div class="price_old">$<span data-bind="text: itemDetail().price"></span></div>
                                <!-- /ko -->
                                <!-- ko if: itemDetail().discount==0 -->
                                <div class="price_new">$<span data-bind="text: itemDetail().price"></span></div>
                                <!-- /ko -->
                            </div>
                        </div>
                        <div class="block_cart">
                            <div class="obn_like">
                                <div class="obn"><a href="#" data-bind="click: addCompare" class="obn"><span data-bind="text: headerMessage().compare"></span></a></div>
                            </div>
                            <div class="cart">
                                <a href="#" data-bind="click: addToCart" class="bay"><span data-bind="text: headerMessage().addToCart"></span></a>
                                <input style="width:35px;height: 35px;" type="text" class="number" data-bind="value: itemQuantity"/>
                                <span data-bind="text: headerMessage().quantity"></span>:
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="grid_12">
                    <div id="wrapper_tab" class="tab1">
                        <a href="#" class="tab1 tab_link"><span data-bind="text: headerMessage().description"></span></a>
                        <a href="#" class="tab2 tab_link"><span data-bind="text: headerMessage().review"></span></a>

                        <div class="clear"></div>
                        <div class="tab1 tab_body">
                            <p data-bind="html: itemDetail().description"></p>
                        </div>
                        <!-- .tab1 .tab_body -->
                        <div class="tab2 tab_body">
                            <h4>Customer reviews</h4>
                            <ul class="comments" data-bind="foreach: {data: itemReview, as: 'review'}">
                                <li>
                                    <div class="autor"><span data-bind="text: review.username"></span></div>,
                                    <time datetime="2012-11-03"><span data-bind="text: review.date"></span></time>
                                    <div class="evaluation">
                                        <div class="quality">
                                            <strong>Quality</strong>
                                            <a data-bind="attr: {class: $root.oneLevel()[review.qualityLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.twoLevel()[review.qualityLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.threeLevel()[review.qualityLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.fourLevel()[review.qualityLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.fiveLevel()[review.qualityLevel - 1]}"></a>
                                        </div>
                                        <div class="price">
                                            <strong>Price</strong>
                                            <a data-bind="attr: {class: $root.oneLevel()[review.priceLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.twoLevel()[review.priceLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.threeLevel()[review.priceLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.fourLevel()[review.priceLevel - 1]}"></a>
                                            <a data-bind="attr: {class: $root.fiveLevel()[review.priceLevel - 1]}"></a>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <p data-bind="text: review.comment"></p>
                                </li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>

            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function pdfPage() {
        var self = this;
        var itemId = '${requestScope.itemId}';

        self.oneLevel = ko.observableArray(['plus', 'plus', 'plus', 'plus', 'plus']);
        self.twoLevel = ko.observableArray(['', 'plus', 'plus', 'plus', 'plus']);
        self.threeLevel = ko.observableArray(['', '', 'plus', 'plus', 'plus']);
        self.fourLevel = ko.observableArray(['', '', '', 'plus', 'plus']);
        self.fiveLevel = ko.observableArray(['', '', '', '', 'plus']);

        self.itemDetail = ko.observable({});
        self.currentShowPicURL = ko.observable();
        self.itemPicArray = ko.observableArray();
        self.itemQuantity = ko.observable(1);
        self.itemReview = ko.observableArray();
        self.averageLevel = ko.observable();

        self.changeShowPic = function (p) {
            self.currentShowPicURL(p.picURL);
        };

        self.addToCart = function() {
            $.post("/cart/add", {itemId: itemId, quantity: self.itemQuantity}, function(resultJson) {
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

        self.addCompare = function() {
            $.get("/compare/add?itemId=" + itemId, function(result) {
                if (result['success']) {
                    window.location.href = "/compare";
                } else {
                    alert(result['errorMessage']);
                }
            })
        };
        (function () {
            headerPage();
            $.get('/store/get_item_id/' + itemId, function (itemJson) {
                self.itemDetail(itemJson['item']);
                self.currentShowPicURL(itemJson['item'].showPicURL);
                self.itemPicArray(itemJson['itemPicList']);
                self.itemPicArray.push({picURL: itemJson['item'].showPicURL});
                self.itemReview(itemJson['evaluateList']);
                self.averageLevel(itemJson['averageLevel']);
            });
        })();
    }
    ko.applyBindings(new pdfPage());
</script>
</html>

