<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Address</title>
    <link href="<%=request.getContextPath() %>/store/css/bootstrap/bootstrap.combined.css" rel="stylesheet"
          type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/grid.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/account.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath() %>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/knockoutjs.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/jsAddress.js"></script>
</head>
<body>
<div id="main_part">
<jsp:include page="common/header.jsp"/>
    <div class="container_12">
        <div class="grid_12">
            <div class="breadcrumbs">
                <a href="/home"><span data-bind="text: headerMessage().home"></span></a><span>&#8250;</span>
                <span class="current"><span data-bind="text: headerMessage().address"></span></span>
            </div>
        </div>
    </div>
<section style="margin: 60px;">
    <div class="container_12" id="account_content">
        <div>
            <div class="tabbable tabs-left" id="tabs-528944">
                <ul class="nav nav-pills nav-stacked" id="account_menu">
                    <li><a href="/account"><span data-bind="text: headerMessage().personalInfo"></span></a></li>
                    <li class="active"><a href="/account/address"><span data-bind="text: headerMessage().address"></span></a></li>
                    <li><a href="/account/order"><span data-bind="text: headerMessage().order"></span></a></li>
                </ul>
                <div class="info_content">
                    <div style="padding: 10px 20px 20px">
                        <div id="main" style="margin: -7px 0 33px 0;">
                            <div id="addressList">
                                <div>
                                    <a class="add_new_button" href="#" data-bind="click: showAddressModal"><span data-bind="text: headerMessage().addNewAddress"></span></a>
                                    <span>You have already added <span>5 </span>addresses，the max number is <span>20</span></span>
                                </div>
                            </div>
                        </div>
                        <div data-bind="foreach: {data: addressArray, as: 'address'}">
                            <div class="address_border">
                                <div class="title">
                                    <h3 class="name">
                                        <span data-bind="text: address.consignee"></span>
                                    </h3>
                                    <div class="del">
                                        <a class="delete_button" href="#" data-bind="click: $root.deleteAddress"></a>
                                    </div>
                                </div>
                                <div class="detail">
                                    <div class="inner">
                                        <div style="width: 450px;">
                                            <div class="clear"></div>
                                            <div>
                                                <span class="info_label"><span data-bind="text: headerMessage().consignee"></span>：</span>
                                                <div>
                                                    <span data-bind="text: address.consignee"></span>
                                                </div>
                                            </div>
                                            <div>
                                                <span class="info_label"><span data-bind="text: headerMessage().location"></span>：</span>

                                                <div>
                                                    <span data-bind="text: address.province + address.city + address.district"></span>
                                                </div>
                                            </div>
                                            <div>
                                                <span class="info_label"><span data-bind="text: headerMessage().address"></span>：</span>

                                                <div>
                                                    <span data-bind="text: address.detail"></span>
                                                </div>
                                            </div>
                                            <div>
                                                <span class="info_label"><span data-bind="text: headerMessage().telephone"></span>：</span>

                                                <div>
                                                    <span data-bind="text: address.telephone"></span>
                                                </div>
                                            </div>
                                            <div>
                                                <span class="info_label"><span data-bind="text: headerMessage().email"></span>：</span>

                                                <div>
                                                    <span data-bind="text: address.email"></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="address_info_footer">
                                                <a class="edit" href="#" data-bind="click: $root.editAddressModal"><span data-bind="text: headerMessage().edit"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</section>
<div>
    <jsp:include page="common/footer.jsp"/>
</div>
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
                <input class="a_save" type="submit" data-bind="click: saveAddress, value: headerMessage().save">
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
    function accountPage() {
        var self = this;
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

        self.deleteAddress = function (p) {
            $.get("/address/delete?addressId=" + p.addressId, function (json) {
                if (json['success']) {
                    alert("delete successful");
                    self.addressArray.remove(p);
                }
            })
        };
        (function () {
            headerPage();
            $.get("/address/getAll", function (json) {
                if (json['success']) {
                    self.addressArray(json['addressArray']);
                }
            })
        })();
    }
    ko.applyBindings(new accountPage());
</script>
</html>
