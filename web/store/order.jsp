<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Address</title>
    <link href="<%=request.getContextPath() %>/store/css/bootstrap/bootstrap.combined.css" rel="stylesheet" type="text/css">
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
                <a href="/home">Home</a><span>&#8250;</span>
                <span class="current">Order</span>
            </div>
        </div>
    </div>
    <section style="margin: 60px;">
        <div class="container_12" id="account_content">
            <div>
                <div class="tabbable tabs-left">
                    <ul class="nav nav-pills nav-stacked" id="account_menu">
                        <li><a href="/account">Personal Info</a></li>
                        <li><a href="/account/address">Address</a></li>
                        <li class="active"><a href="/account/order">Order</a></li>
                    </ul>
                    <div class="info_content">
                        <div style="padding: 10px 20px 20px">
                            <div data-bind="foreach: {data: orderArray, as: 'order'}">
                                <div class="order_border">
                                    <div style="height: 40px; background-color: #e5e5e5">
                                    <div class="title">
                                        <h5 class="name">
                                            <span style="padding-left: 10px">Date: <span data-bind="text: order.createTime"></span></span>
                                            <span style="padding-left: 50px">Order Number: <span data-bind="text: order.orderId"></span></span>
                                            <span style="padding-left: 50px">Consignee: <span data-bind="text: order.address.consignee"></span></span>
                                        </h5>
                                        <div class="del">
                                            <a class="delete_button" href="#" data-bind="click: $root.deleteOrder"></a>
                                        </div>
                                    </div>
                                        </div>
                                    <div class="detail">
                                        <table style="margin: 0">
                                            <tr>
                                                <td colspan="2">Total Price: <span>$499</span></td>
                                                <!-- ko if: order.status == "Not Confirm" -->
                                                <td colspan="1">Status: <span data-bind="text: order.status"></span></td>
                                                <td><span><button style="width: 65px; height: 28px; margin-left: 60px" data-bind="click: $root.updateStatus.bind($data, -1, order.orderId)">Cancel</button></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Non-payment" -->
                                                <td colspan="1">Status: <span data-bind="text: order.status"></span></td>
                                                <td><span><button style="width: 65px; height: 28px; margin-left: 60px">Pay</button></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Delivered" -->
                                                <td colspan="1">Status: <span data-bind="text: order.status"></span></td>
                                                <td><span><button style="width: 65px; height: 28px; margin-left: 60px">Pay</button></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Canceled" || order.status == "Confirmed" || order.status == "Finished" -->
                                                <td colspan="2">Status: <span data-bind="text: order.status"></span></td>
                                                <!-- /ko -->

                                            </tr>
                                            <tr>
                                                <td colspan="1">
                                                    Telephone: <span data-bind="text: order.address.telephone"></span>
                                                </td>
                                                <td colspan="2">
                                               Address: <span data-bind="text: order.address.province + order.address.city + order.address.district + ' ' + order.address.detail"></span>
                                                </td>
                                                <td colspan="1">Email: <span data-bind="text: order.address.email"></span></td>
                                            </tr>
                                            <tbody data-bind="foreach: {data: order.items, as: 'itemMap'}">
                                            <tr>
                                                <td><img style="width: 70px" data-bind="attr: {src: itemMap.item.showPicURL}"/></td>
                                                <td style="width: 300px"><span data-bind="text: itemMap.item.itemName">iphone5s</span></td>
                                                <td>$<span data-bind="text: itemMap.unitCost"></span></td>
                                                <td>x<span data-bind="text: itemMap.quantity"></span></td>

                                            </tr>
                                            </tbody>
                                        </table>
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

</body>
<script>
    function orderPage() {
        var self = this;
        self.orderArray = ko.observableArray();

        self.deleteOrder = function (p) {
            $.get("/order/delete?orderId=" + p.orderId, function (json) {
                if (json['success']) {
                    self.orderArray.remove(p);
                }
            })
        };

        self.updateStatus = function (status, orderId) {
            $.post("/order/update", {status: status, orderId: orderId}, function (json) {
                if (json['success']) {
                    $.get("/order/all", function (json) {
                        self.orderArray(json['orderArray']);
                    });
                }
            })
        };
        (function () {
            headerPage();
            $.get("/order/all", function (json) {
                if (json['success']) {
                    self.orderArray(json['orderArray']);
                }
            })
        })();
    }
    ko.applyBindings(new orderPage());
</script>

</html>
