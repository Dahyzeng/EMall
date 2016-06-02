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
                <a href="/home"><span data-bind="text: headerMessage().home"></span></a><span>&#8250;</span>
                <span class="current"><span data-bind="text: headerMessage().order"></span></span>
            </div>
        </div>
    </div>
    <section style="margin: 60px;">
        <div class="container_12" id="account_content">
            <div>
                <div class="tabbable tabs-left">
                    <ul class="nav nav-pills nav-stacked" id="account_menu">
                        <li><a href="/account"><span data-bind="text: headerMessage().personalInfo"></span></a></li>
                        <li><a href="/account/address"><span data-bind="text: headerMessage().address"></span></a></li>
                        <li class="active"><a href="/account/order"><span data-bind="text: headerMessage().order"></span></a></li>
                    </ul>
                    <div class="info_content">
                        <div style="padding: 10px 20px 20px">
                            <div data-bind="foreach: {data: orderArray, as: 'order'}">
                                <div class="order_border">
                                    <div style="height: 40px; background-color: #e5e5e5">
                                    <div class="title">
                                        <h5 class="name">
                                            <span style="padding-left: 10px"><span data-bind="text: headerMessage().date"></span>: <span data-bind="text: order.createTime"></span></span>
                                            <span style="padding-left: 50px"><span data-bind="text: headerMessage().orderId"></span>: <span data-bind="text: order.orderId"></span></span>
                                            <span style="padding-left: 50px"><span data-bind="text: headerMessage().consignee"></span>: <span data-bind="text: order.address.consignee"></span></span>
                                        </h5>
                                        <div class="del">
                                            <a class="delete_button" href="#" data-bind="click: $root.deleteOrder"></a>
                                        </div>
                                    </div>
                                        </div>
                                    <div class="detail">
                                        <table style="margin: 0">
                                            <tr>
                                                <td colspan="2"><span data-bind="text: headerMessage().total"></span>: <span>$499</span></td>
                                                <!-- ko if: order.status == "Unconfirmed" -->
                                                <td colspan="2"><span data-bind="text: headerMessage().status"></span>: <span data-bind="text: headerMessage().unconfirmed"></span></td>
                                                <td colspan="2">
                                                    <span>
                                                        <button style="width: 65px; height: 28px; margin-left: 60px" data-bind="click: $root.updateStatus.bind($data, -1, order.orderId)">
                                                            <span data-bind="text: headerMessage().cancel"></span>
                                                        </button>
                                                    </span>
                                                </td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Non-payment" -->
                                                <td colspan="2"><span data-bind="text: headerMessage().status"></span>: <span data-bind="text: headerMessage().nonPayment"></span></td>
                                                <td colspan="2"><span><button style="width: 65px; height: 28px;"><span data-bind="text: headerMessage().pay"></span></button></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Delivered" -->
                                                <td colspan="2"><span data-bind="text: headerMessage().status"></span>: <span data-bind="text: headerMessage().delivered"></span></td>
                                                <td colspan="2">
                                                    <span style="float: left; margin-right: 20px">
                                                        <button style="width: 65px; height: 28px; margin-left: 60px" data-bind="click: $root.checkExpress">
                                                            <span data-bind="text: headerMessage().check"></span>
                                                        </button>
                                                    </span>
                                                    <span>
                                                        <button style="width: 100px; height: 28px; margin-left: 60px" data-bind="click: $root.updateStatus.bind($data, 3, order.orderId)">
                                                            <span data-bind="text: headerMessage().receipt"></span>
                                                        </button>
                                                    </span>
                                                </td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Canceled" -->
                                                <td colspan="2"><span data-bind="text: headerMessage().status"></span>: <span data-bind="text: headerMessage().canceled"></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Confirmed" -->
                                                <td colspan="2"><span data-bind="text: headerMessage().status"></span>: <span data-bind="text: headerMessage().confirmed"></span></td>
                                                <!-- /ko -->
                                                <!-- ko if: order.status == "Finished" -->
                                                <td colspan="2">
                                                    <span data-bind="text: headerMessage().status"></span>:
                                                    <span data-bind="text: headerMessage().finished"></span>
                                                </td>
                                                <td colspan="2">
                                                    <span style="float: left; margin-right: 20px">
                                                        <button style="width: 65px; height: 28px; margin-left: 60px" data-bind="click: $root.checkExpress">
                                                            <span data-bind="text: headerMessage().check"></span>
                                                        </button>
                                                    </span>
                                                </td>
                                                <!-- /ko -->

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <span data-bind="text: headerMessage().telephone"></span>: <span data-bind="text: order.address.telephone"></span>
                                                </td>
                                                <td colspan="2">
                                                    <span data-bind="text: headerMessage().address"></span>: <span data-bind="text: order.address.province + order.address.city + order.address.district + ' ' + order.address.detail"></span>
                                                </td>
                                                <td colspan="2"><span data-bind="text: headerMessage().email"></span>: <span data-bind="text: order.address.email"></span></td>
                                            </tr>
                                            <tbody data-bind="foreach: {data: order.items, as: 'itemMap'}">
                                            <tr>
                                                <td colspan="1"><img style="width: 70px" data-bind="attr: {src: itemMap.item.showPicURL}"/></td>
                                                <td colspan="2"><span data-bind="text: itemMap.item.itemName">iphone5s</span></td>
                                                <td colspan="1">$<span data-bind="text: itemMap.unitCost"></span></td>
                                                <td colspan="1">x<span data-bind="text: itemMap.quantity"></span></td>
                                                <!-- ko if: order.status == "Finished" -->
                                                <!-- ko if: itemMap.evaluated == 0-->
                                                <td colspan="1"><button style="float: right; margin-right: 67px; width: 50px;" data-bind="click: $root.onEvaluate.bind($data, order.orderId)"><span data-bind="text: headerMessage().evaluate"></span></button></td>
                                                <!-- /ko -->
                                                <!-- ko ifnot: itemMap.evaluated == 0-->
                                                <td colspan="1"><span data-bind="text: headerMessage().evaluated"></span></td>
                                                <!-- /ko -->
                                                <!-- /ko -->
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
<div id="express_modal" class="address_modal" style="width: 370px">
    <div class="inner" style="width:370px;">
        <div class="modal_title">
            <span data-bind="text: headerMessage().expressInfo"></span>
            <span class="modal_close"><a href="#" data-bind="click: modalClose">X</a></span>
        </div>

        <div class="a_modal_content">
            <div class="a_label">
                <p style="float: left; width: 100px">
                    <span style="float: right" data-bind="text: headerMessage().expressName + ':'"></span>
                </p>
                <span data-bind="text: currentExpress().expressName"></span>
            </div>
            <div class="a_label">
                <p style="float: left; width: 100px">
                    <span style="float: right" data-bind="text: headerMessage().expressNumber + ':'"></span>
                </p>
                <span data-bind="text: currentExpress().expressNumber"></span>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function showModal () {
        $('#express_modal').css('display', 'block');
        $('#main_part').css('opacity', '0.5');
    }
    function closeModal() {
        $('#express_modal').css('display', 'none');
        $('#main_part').css('opacity', '');
    }
    function orderPage() {
        var self = this;
        self.orderArray = ko.observableArray();

        self.onEvaluate = function (orderId) {
           window.location.href = "/evaluate/" + this.item.itemId + "/" + orderId;
        };
        self.deleteOrder = function (p) {
            $.get("/order/delete?orderId=" + p.orderId, function (json) {
                if (json['success']) {
                    self.orderArray.remove(p);
                }
            })
        };

        self.currentExpress = ko.observable({});
        self.checkExpress = function (p) {
            self.currentExpress(p.expressInfo);
            showModal();
        };
        self.modalClose = function () {
            closeModal();
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
