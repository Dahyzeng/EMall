<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Proceed to checkout</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/account.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/cartStyle.css" media="screen" rel="stylesheet" type="text/css">
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
                <h1 class="page_title"><span data-bind="text: headerMessage().checkoutFill"></span></h1>

                <aside id="community_poll">
                    <h4><span data-bind="text: headerMessage().chooseAddress"></span></h4>
                    <ul style="list-style: none; padding: 0 0 0" data-bind="foreach: {data: addressArray, as: 'address'}">
                        <li>
                            <input class="niceRadio" type="radio" name="addressId" data-bind="value: ko.toJSON(address)"/>
                            <span data-bind="text: address.consignee + ' ' + address.province + address.city + address.district + ' ' + address.detail"></span>
                            <a href="#" class="c_edit_a" data-bind="click: $root.editAddressModal"><span data-bind="text: headerMessage().edit"></span></a>
                        </li>
                    </ul>
                    <!-- ko if: addressArray().length < 5 -->
                    <a style="text-decoration: none" href="#" data-bind="click: showAddressModal"><span data-bind="text: headerMessage().addNewAddress"></span></a>
                    <!-- /ko -->
                </aside>

                <div>
                    <h3><span data-bind="text: headerMessage().choosePayment"></span></h3>
                    <ul style="list-style: none; padding: 0 0 0">
                        <li style="float: left; margin-right: 100px">
                            <input class="niceRadio" type="radio" name="payMethod" value="Pay On Delivery"/><span data-bind="text: headerMessage().payOnDelivery"></span>
                        </li>
                        <li>
                            <input class="niceRadio" type="radio" name="payMethod" value="Pay Online"/><span data-bind="text: headerMessage().payOnline"></span>
                        </li>
                    </ul>
                </div>
                <div>
                    <h3><span data-bind="text: headerMessage().itemReview"></span></h3>
                    <table class="cart_product" style="margin-top: 0">
                        <tr>
                            <th class="images"></th>
                            <th class="bg name"><span data-bind="text: headerMessage().productName"></span></th>
                            <th class="bg price"><span data-bind="text: headerMessage().unitPrice"></span></th>
                            <th class="qty"><span data-bind="text: headerMessage().quantity"></span></th>
                            <th class="bg subtotal"><span data-bind="text: headerMessage().subtotal"></span></th>
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
                                <div class="price_new">$<span data-bind="text: ($data.item.price - $data.item.discount).toFixed(1)"></span></div>
                                <div class="    price_old">$<span data-bind="text: $data.item.price"></span></div>
                                <!-- /ko -->
                                <!-- ko if: item.discount==0 -->
                                <div class="price_new">$<span data-bind="text: $data.item.price"></span></div>
                                <!-- /ko -->
                            </td>
                            <td>
                                <span data-bind="text: $data.quantity"></span>
                            </td>
                            <td class="bg subtotal">$<span data-bind="text: ($data.item.price - $data.item.discount).toFixed(1) * $data.quantity"></span></td>

                        </tr>

                    </table>
                    <div style="float: right">
                        <h4><span data-bind="text: headerMessage().total"></span>: $<span data-bind="text: selectTotalPrice"></span></h4>
                        <button style="margin-left: 60px" data-bind="click: placeOrder">&nbsp <span data-bind="text: headerMessage().submitOrder"></span> &nbsp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</div>

<div id="address_modal" class="address_modal">
    <div class="inner">
        <div class="modal_title">
            <span data-bind="text: headerMessage().addNewAddress"></span>
            <span class="modal_close"><a href="#" data-bind="click: modalClose">X</a></span>
        </div>
        <div class="a_modal_content">
            <div class="a_label">
                <p><span style="color: red;">*</span><span data-bind="text: headerMessage().consignee"></span>:</p>
                <input data-bind="value: currentAddress().consignee" type="text"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span><span data-bind="text: headerMessage().location"></span>:</p>
                <div style="float: left;">
                    <p style="line-height: 30px;">
                        <span class="a_font"><span data-bind="text: headerMessage().province"></span>：</span><select style="vertical-align: middle;" class="a_select" id="cmbProvince"></select>
                        <span class="a_font"><span data-bind="text: headerMessage().city"></span>：</span><select class="a_select" id="cmbCity"></select>
                        <span class="a_font"><span data-bind="text: headerMessage().district"></span>：</span><select class="a_select" id="cmbArea"></select>
                        <input name="province" data-bind="value: currentAddress.province" type="hidden"/>
                        <input name="city" data-bind="value: currentAddress.city" type="hidden"/>
                        <input name="district" data-bind="value: currentAddress.district" type="hidden"/>
                        <script type="text/javascript">
                            var province = $('input[name="province"]').val();
                            var city = $('input[name="city"]').val();
                            var district = $('input[name="district"]').val();
                            addressInit('cmbProvince', 'cmbCity', 'cmbArea', province, city, district);
                        </script>
                    </p>
                </div>
            </div>
            <div class="a_label" style="clear: both;">
                <p><span style="color: red;">*</span><span data-bind="text: headerMessage().addressDetail"></span>：</p>
                <input style="width: 484px;" type="text" data-bind="value: currentAddress().detail"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span><span data-bind="text: headerMessage().telephone"></span>：</p>
                <input type="text" data-bind="value: currentAddress().telephone"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span><span data-bind="text: headerMessage().email"></span>：</p>
                <input type="text" data-bind="value: currentAddress().email"/>
            </div>
            <div style="margin: 10px 0 0;">
                <input class="a_save" type="submit" data-bind="click: saveAddress, value: headerMessage().save"/>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function openModal() {
        $('#address_modal').css('display', 'block');
        $('#main_part').css('opacity', '0.5');
    }
    function closeModal() {
        $('#address_modal').css('display', 'none');
        $('#main_part').css('opacity', '');
    }
    function checkoutPage() {
        var self = this;

        self.items = ko.observable({});
        self.addressArray = ko.observableArray();
        self.currentAddress = ko.observable({});
        self.operationType = ko.observable();
        self.selectTotalPrice = ko.observable();

        self.showAddressModal = function () {
            openModal();
            self.operationType('add');
        };
        self.editAddressModal = function (p) {
            openModal();
            self.currentAddress(p);
            addressInit('cmbProvince', 'cmbCity', 'cmbArea', p.province, p.city, p.district);
            self.operationType('edit');
        };
        self.modalClose = function () {
            closeModal();
        };
        self.saveAddress = function () {
            self.currentAddress().province = ($('#cmbProvince').val());
            self.currentAddress().city = ($('#cmbCity').val());
            self.currentAddress().district = ($('#cmbArea').val());
            $.post("/address/edit", self.currentAddress(), function (json) {
                if (json['success']) {
                    alert("success");
                    if (self.operationType() == 'add') {
                        self.addressArray.push(self.currentAddress());
                    } else {
                        $.get("/address/getAll", function (json) {
                            if (json['success']) {
                                self.addressArray(json['addressArray']);
                            }
                        });
                    }
                    self.currentAddress({});
                    closeModal();
                }
            })
        };

        self.placeOrder = function () {
            var address = $("input[name='addressId']:checked ").val();
            var payMethod = $("input[name='payMethod']:checked").val();
            if (address && payMethod) {
                $.post("/order/confirm", {addressJson: address, payMethod: payMethod}, function (json) {
                    if (json['success']) {
                        window.location.href = "/checkout/confirm";
                    }
                })
            }

        };

        (function () {
            $.get("/order/flow_data", function (json) {
                if (json['success']) {
                    self.items(eval('('+ json['items']+')'));
                    var total = 0;
                    for (var i = 0; i < self.items().length; i++) {
                        total = self.items()[i].quantity * (self.items()[i].item.price - self.items()[i].item.discount) + total;
                    }
                    self.selectTotalPrice(total.toFixed(1));
                }
            });
            headerPage();
            $.get("/address/getAll", function (json) {
                if (json['success']) {
                    self.addressArray(json['addressArray']);
                }
            });
        })();
    }
    ko.applyBindings(new checkoutPage());
</script>
</html>

