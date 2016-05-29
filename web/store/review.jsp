<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
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
            <a href="/home"><span data-bind="text: headerMessage().home"></span></a><span>&#8250;</span>
            <span class="current" data-bind="text: headerMessage().personalInfo"></span>
        </div>
    </div>
</div>
<section id="main" style="padding-top: 20px">
    <div style="margin-left: auto;margin-right: auto; width: 984px">
        <h4>Write Your Own Review</h4>
        <div class="listing_product" style="margin: 0">
        <div class="product_li">
        <div class="grid_3">
            <div class="prev" style="height: 270px;">
                <a href="product_page.html"><img data-bind="attr: {src: item().showPicURL}"/></a>
                <div style="text-align: center"><span data-bind="text: item().itemName"></span></div>
            </div>
        </div>

        <div class="grid_5" style="width: 720px">
            <div style="padding-top: 20px">
                <form class="add_comments">
                    <div class="evaluation">
                        <div class="quality">
                            <strong>Quality</strong><sup class="surely">*</sup>
                            <div style="float: right;margin-left: 8px" class="review" data-bind="foreach: levelArray">
                                <a data-bind="attr: {class: $root.qualityPlusArray()[$data]}, event: { mouseover: $root.changeQualityPlus}"></a>
                            </div>
                        </div>
                        <div class="price">
                            <strong>Price</strong><sup class="surely">*</sup>
                            <div style="float: right;margin-left: 8px" class="review" data-bind="foreach: levelArray">
                                <a data-bind="attr: {class: $root.pricePlusArray()[$data]}, event: { mouseover: $root.changePricePlus}"></a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <strong>Review</strong><sup class="surely">*</sup>
                        <br>
                        <textarea id="comment" style="width: 700px; max-width: 700px;height: 83px;max-height: 83px"></textarea>
                    </div>
                    <button data-bind="click: onSubmitReview">Submit</button>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    </div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function evaluatePage() {
        var self = this;
        var itemId = '${requestScope.itemId}';
        var orderId = '${requestScope.orderId}';
        var priceRate = -1;
        var qualityRate = -1;
        self.item = ko.observable({});
        self.levelArray = [0, 1, 2, 3, 4];
        self.qualityPlusArray = ko.observableArray(['','','','','']);
        self.pricePlusArray = ko.observableArray(['','','','','']);
        self.changeQualityPlus = function (p) {
            var level = ['', '', '', '', ''];
            for (var i = 0; i <= p; i++) {
                level[i] = 'plus';
            }
            self.qualityPlusArray(level);
            qualityRate = p + 1;
        };
        self.changePricePlus = function (p) {
            var level = ['', '', '', '', ''];
            for (var i = 0; i <= p; i++) {
                level[i] = 'plus';
            }
            self.pricePlusArray(level);
            priceRate = p + 1;
        };

        self.onSubmitReview = function () {
            if (priceRate == 0 || qualityRate == 0) {
                alert("please mark the rate");
                return;
            }

            $.post("/review/add", {priceRate: priceRate, qualityRate: qualityRate, itemId: itemId, comment: $("#comment").val(), orderId: orderId}, function (json) {
                if (json['success']) {
                    alert("Thank you for your Review");
                    window.location.href = "/account/order";
                }
            })
        };

        (function () {
            headerPage();
            $.get("/store/review_item/" + itemId, function (json) {
                self.item(json['item']);
            })
        })();
    }
    ko.applyBindings(new evaluatePage())
</script>
</html>
