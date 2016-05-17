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
                <h1 class="page_title">Checkout</h1>

                <aside id="community_poll">
                    <h4>Choose Address</h4>
                    <ul style="list-style: none; padding: 0 0 0" data-bind="foreach: {data: addressArray, as: 'address'}">
                        <li>
                            <input class="niceRadio" type="radio" name="addressId" data-bind="value: ko.toJSON(address)"/>
                            <span data-bind="text: address.consignee + ' ' + address.province + address.city + address.district + ' ' + address.detail"></span>
                            <a href="#" class="c_edit_a" data-bind="click: $root.editAddressModal">Edit</a>
                        </li>
                    </ul>
                    <!-- ko if: addressArray().length < 5 -->
                    <a style="text-decoration: none" href="#" data-bind="click: showAddressModal">Add New Address</a>
                    <!-- /ko -->
                </aside>

                <div>
                    <h3>Choose Payment</h3>
                    <ul style="list-style: none; padding: 0 0 0">
                        <li style="float: left; margin-right: 100px">
                            <input class="niceRadio" type="radio" name="payMethod" value="Pay On Delivery"/><span>Pay On Delivery</span>
                        </li>
                        <li>
                            <input class="niceRadio" type="radio" name="payMethod" value="Pay Online">Pay Online
                        </li>
                    </ul>
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
                    <div style="float: right">
                        <h4>Total Price: $400</h4>
                        <button style="margin-left: 60px" data-bind="click: placeOrder">&nbsp Place Order &nbsp</button>
                    </div>
                </div>
            </div>

            <!-- #sidebar_right -->
        </div>
        <!-- #content -->
        <div class="clear"></div>
    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</div>

<div id="address_modal" class="address_modal">
    <div class="inner">
        <div class="modal_title">
            <span>Add New Address</span>
            <span class="modal_close"><a href="#" data-bind="click: modalClose">X</a></span>
        </div>
        <div class="a_modal_content">
            <div class="a_label">
                <p><span style="color: red;">*</span>Consignee:</p>
                <input data-bind="value: currentAddress().consignee" type="text"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span>Area:</p>
                <div style="float: left;">
                    <p style="line-height: 30px;">
                        <span class="a_font">Province：</span><select style="vertical-align: middle;" class="a_select" id="cmbProvince"></select>
                        <span class="a_font">City：</span><select class="a_select" id="cmbCity"></select>
                        <span class="a_font">District：</span><select class="a_select" id="cmbArea"></select>
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
                <p><span style="color: red;">*</span>Detail Address：</p>
                <input style="width: 484px;" type="text" data-bind="value: currentAddress().detail"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span>Telephone：</p>
                <input type="text" data-bind="value: currentAddress().telephone"/>
            </div>
            <div class="a_label">
                <p><span style="color: red;">*</span>Email：</p>
                <input type="text" data-bind="value: currentAddress().email"/>
            </div>
            <div style="margin: 10px 0 0;">
                <input class="a_save" type="submit" data-bind="click: saveAddress" value="Save">
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
            var address = $("input[name='addressId']").val();
            var payMethod = $("input[name='payMethod']:checked").val();
            $.post("/order/confirm", {addressJson: address, payMethod: payMethod}, function (json) {
                if (json['success']) {
                    window.location.href = "/checkout/confirm";
                }
            })
        };

        (function () {
            $.get("/order/flow_data", function (json) {
                if (json['success']) {
                    self.items(eval('('+ json['items']+')'));
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

