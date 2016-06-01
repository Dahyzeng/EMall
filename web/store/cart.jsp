<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shoping cart</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/cartStyle.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<section id="main" style="margin-top: 30px">
    <div class="container_12">
        <div id="content" class="grid_12">
            <h4><span data-bind="text: message" style="color: red"></span></h4>
            <h1 class="page_title"><span data-bind="text: headerMessage().shoppingCart"></span></h1>
            <table class="cart_product">
                <tr>
                    <th></th>
                    <th class="bg name"><span data-bind="text: headerMessage().pic"></span></th>
                    <th class="bg name"><span data-bind="text: headerMessage().productName"></span></th>
                    <th class="bg price"><span data-bind="text: headerMessage().unitPrice"></span></th>
                    <th class="qty"><span data-bind="text: headerMessage().quantity"></span></th>
                    <th class="bg subtotal"><span data-bind="text: headerMessage().subtotal"></span></th>
                    <th class="close"></th>
                </tr>
                <tbody data-bind="foreach: {data: cartItemArray, as: 'itemMap'}">
                <tr>
                    <td><input type="checkbox" name="selectItem" data-bind="checked: selectItems, value: itemMap"></td>
                    <td class="images">
                        <a data-bind="attr: {href: '/pdf/' + itemMap.item.itemId}">
                            <img data-bind="attr: {src: itemMap.item.showPicURL}" alt="Product 6">
                        </a>
                    </td>
                    <td class="bg name">
                        <span data-bind="text: itemMap.item.itemName"></span>
                    </td>
                    <td class="bg price">
                        <!-- ko ifnot: itemMap.item.discount==0 -->
                        <div class="price_new">$<span data-bind="text: (itemMap.item.price - item.discount).toFixed(1)"></span></div>
                        <div class="price_old">$<span data-bind="text: itemMap.item.price"></span></div>
                        <!-- /ko -->
                        <!-- ko if: item.discount==0 -->
                        <div class="price_new">$<span data-bind="text: itemMap.item.price"></span></div>
                        <!-- /ko -->
                    </td>
                    <td class="qty">
                        <input type="text" onKeyPress="return isNum(event)" style="width: 40px" data-bind="value: itemMap.quantity, event: {blur: updateItem}"/>
                        <script language="javascript" type="text/javascript">
                            function isNum(e) {
                                var k = window.event ? e.keyCode : e.which;
                                if (((k >= 48) && (k <= 57)) || k == 8 || k == 0) {
                                } else {
                                    if (window.event) {
                                        window.event.returnValue = false;
                                    }
                                    else {
                                        e.preventDefault(); //for firefox
                                    }
                                }
                            }
                        </script>
                    </td>
                    <td class="bg subtotal">$<span data-bind="text:  (itemMap.item.price - item.discount).toFixed(1) * itemMap.quantity"></span></td>
                    <td class="close">
                        <a data-bind="click: deleteItem, attr: {title: headerMessage().del}" class="close" href="#"></a>
                    </td>
                </tr>
                </tbody>
                <tr>
                    <td colspan="7" class="cart_but">
                        <span style="float: right" ><span data-bind="text: headerMessage().total"></span>: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span data-bind="text: total"></span></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="cart_but">
                        <button data-bind="click: continueShopping" style="width: 150px; float: left"><< <span data-bind="text: headerMessage().continueShopping"></span></button>
                        <button style="float: right; width: 90px" data-bind="click: placeOrder"><span data-bind="text: headerMessage().placeOrder"></span></button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function cartPage() {

        self.message = ko.observable();
        self.selectItems = ko.observableArray();
        self.total = ko.observable(0);
        self.updateItem = function (p) {
            $.post("/cart/update", {itemId: p.item.itemId, quantity: p.quantity}, function(resultJson) {
                if (!resultJson['success']) {
                    self.message(resultJson['errorMessage']);
                } else {
                    self.message('');
                }
                getCartItem();
            })
        };
        self.selectItems.subscribe (function () {
            var totalPrice = 0;
            for (var i = 0; i < self.selectItems().length; i ++) {
                totalPrice = (self.selectItems()[i].item.price - self.selectItems()[i].item.discount) * self.selectItems()[i].quantity + totalPrice;
            }
            self.total(totalPrice.toFixed(1));
        });

        self.continueShopping = function () {
            window.location.href = "/home";
        };

        self.placeOrder = function () {
            if (self.selectItems().length == 0) {
                alert("please select items");
                return;
            }
            $.post("/order/items", {items: JSON.stringify(self.selectItems())}, function (json) {
                if (json['success']) {
                    window.location.href = "/checkout";
                }
            })
        };

        self.deleteItem = function (p) {
            $.get("/cart/delete?itemId=" + p.item.itemId, function(resultJson) {
                if (resultJson['success']) {
                    self.cartItemArray.remove(p);
                    self.message('');
                } else {
                    self.message(resultJson['errorMessage']);
                }
            });
        };
        (function() {
            headerPage();
        })();
    }
    ko.applyBindings(new cartPage());
</script>
</html>
