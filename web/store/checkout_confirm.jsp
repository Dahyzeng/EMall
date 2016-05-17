<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Proceed to checkout</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/account.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/jsAddress.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/html5.js"></script>
</head>

<body>
<div id="main_part">
    <jsp:include page="common/header.jsp"/>
    <section id="main" class="entire_width" style="margin-top: 20px">
        <div class="container_12">
            <div id="content">
                <div class="grid_12">
                    <h1 class="page_title">Checkout Confirm</h1>

                    <div>
                        <h3 style="padding-bottom: 0">Address Info</h3>
                        <div class="detail">
                            <div class="inner">
                                <div style="width: 450px;">
                                    <div class="clear"></div>
                                    <div>
                                        <span class="info_label">consignee：</span>
                                        <div>
                                            <span data-bind="text: address().consignee"></span>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="info_label">location：</span>

                                        <div>
                                            <span data-bind="text: address().province + address().city + address().district"></span>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="info_label">address：</span>

                                        <div>
                                            <span data-bind="text: address().detail"></span>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="info_label">telephone：</span>

                                        <div>
                                            <span data-bind="text: address().telephone"></span>
                                        </div>
                                    </div>
                                    <div>
                                        <span class="info_label">email：</span>

                                        <div>
                                            <span data-bind="text: address().email"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                    </div>

                    <div style="margin-bottom: 20px">
                        <h3 style="padding-bottom: 10px">Pay Method</h3>
                        <span data-bind="text: payMethod"></span>
                    </div>
                    <div>
                        <h3>Item Detail</h3>
                        <table class="cart_product" style="margin-top: 0">
                            <tr>
                                <th class="images"></th>
                                <th class="bg name">Product Name</th>
                                <th class="bg price">Unit Price</th>
                                <th class="qty">Qty</th>
                                <th class="bg subtotal">Subtotal</th>
                            </tr>
                            <tbody data-bind="foreach: items">
                            <tr>
                                <td class="images">
                                    <a data-bind="attr: {href: '/pdf/' + $data.item.itemId}">
                                        <img data-bind="attr: {src: $data.item.showPicURL}" alt="Product 6">
                                    </a>
                                </td>
                                <td class="bg name">
                                    <span data-bind="text: $data.item.itemName"></span>
                                </td>
                                <td class="bg price">
                                    <!-- ko ifnot: item.discount==0 -->
                                    <div class="price_new">$<span data-bind="text: $data.item.price - $data.item.discount"></span></div>
                                    <div id="price_old">$<span data-bind="text: $data.item.price"></span></div>
                                    <!-- /ko -->
                                    <!-- ko if: item.discount==0 -->
                                    <div class="price_new">$<span data-bind="text: $data.item.price"></span></div>
                                    <!-- /ko -->
                                </td>
                                <td class="qty">
                                    <span data-bind="text: $data.quantity"></span>
                                </td>
                                <td class="bg subtotal">$<span data-bind="text: $data.item.price * $data.quantity"></span></td>
                            </tr>
                        </table>
                        <div>
                            <h4>Total Price: $<span data-bind="text: total"></span></h4>
                        </div>
                        <div>
                            <button style="float: left; width: 60px" data-bind="click: backButton">Back</button>
                            <button style="margin-left: 60px;float: right" id="confirm_button" data-bind="click: placeOrder">&nbsp Confirm &nbsp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </section>
    <jsp:include page="common/footer.jsp"/>
</div>
<div id="delivery_modal" class="order_modal">
    <div class="inner">
        <div class="modal_title">
            <span>General Order Success</span>
            <span class="modal_close"><a href="#">X</a></span>
        </div>
        <div class="a_modal_content" style="padding-bottom: 0">
            <div style="text-align: center">
                <h4>Thanks for your order <span data-bind="text: orderNumber"></span></h4>
                <h5>You can click <a href="/account/order">here</a> to see the detail</h5>
            </div>
        </div>
    </div>
</div>
<div id="online_modal" class="order_modal">
    <div class="inner">
        <div class="modal_title">
            <span>General Order Success</span>
            <span class="modal_close"><a href="#" data-bind="click: closeModal">X</a></span>
        </div>
        <div class="a_modal_content">
            <div style="text-align: center">
                <h4>Place Order Success</h4>
            </div>
            <div style="margin-bottom: 30px">
                <button style="float: left; width: 100px; margin-left: 100px">Pay For Order</button>
                <button style="float: right; width:100px; margin-right: 112px">Continue Shopping</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function openModal(modal) {
        $('#' + modal).css('display', 'block');
        $('#main_part').css('opacity', '0.5');
    }
    function closeModal(modal) {
        $('#' + modal).css('display', 'none');
        $('#main_part').css('opacity', '');
        window.location.href = "/home";
    }
    function checkoutPage() {
        var self = this;
        self.items = ko.observableArray();
        self.address = ko.observable({});
        self.total = ko.observable(0);
        self.orderNumber = ko.observable();
        self.payMethod = ko.observable();
        self.modalType = ko.observable();
        self.backButton = function () {
            window.location.href = "/checkout"
        };

        self.closeModal = function () {
            closeModal(self.modalType());
        };
        self.placeOrder = function () {
            $("#confirm_button").attr("disabled", true);
            $.get("/order/place", function (json) {
                if (json['success']) {
                    self.orderNumber(json['orderId']);
                    if (json['payMethod'] == "Pay On Delivery") {
                        self.orderNumber(json['orderId']);
                        self.modalType("delivery_modal");
                    } else {
                        self.modalType("online_modal");
                    }
                    openModal(self.modalType());
                } else {
                    $("#confirm_button").removeAttr("disabled");
                }
            });
        };
        (function () {
            headerPage();
            $.get("/order/flow_data", function (json) {
                if (json['success']) {
                    self.address(eval('(' + json['address'] + ')'));
                    self.payMethod(json['payMethod']);
                    self.items(eval('(' + json['items'] + ')'));
                    for (var i = 0; i < self.items().length; i++) {
                        self.total(self.items()[i].item.price * self.items()[i].quantity + self.total());
                    }
                }
            })
        })();
    }
    ko.applyBindings(new checkoutPage());
</script>
</html>

