<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/tables.css" type="text/css"
          media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
<body>


<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>

<div class="content">
    <div class="contentHeader">
        <h1 class="page-title">Order</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li class="active">Order</li>
    </ul>

    <div class="container-fluid">
        <div id="pad-wrapper">
            <div class="table-wrapper orders-table section">
                <div>
                    <ul class="nav nav-pills">
                        <li data-bind="attr: {class: allClass}">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 10)">All</a>
                        </li>
                        <li data-bind="attr: {class: payClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, -2)">Not-payment</a>
                        </li>
                        <li data-bind="attr: {class: unConfirmClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 0)">Unconfirmed</a>
                        </li>
                        <li data-bind="attr: {class: confirmClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 1)">Confirmed</a>
                        </li>
                        <li data-bind="attr: {class: deliverClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 2)">Delivered</a>
                        </li>
                        <li data-bind="attr: {class: finishClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 3)">Finished</a>
                        </li>
                        <li data-bind="attr: {class: cancelClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, -1)">Canceled</a>
                        </li>
                        <li data-bind="attr: {class: deleteClass}" style="margin-left: 20px">
                            <a href="#" data-bind="click: getOrderByStatus.bind($data, 5)">Deleted</a>
                        </li>
                        <li style="margin-left: 154px">
                            <input style="margin-top: 7px; height: 28px" type="text" placeholder="order id"/>
                            <button class="btn btn-success">search</button>
                        </li>
                    </ul>
                </div>
                <div class="row-fluid">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span2">
                                Order ID
                            </th>
                            <th class="span2">
                                Date
                            </th>
                            <th class="span1">
                                <span class="line"></span>
                                Name
                            </th>
                            <th class="span2">
                                <span class="line"></span>
                                Pay method
                            </th>
                            <th class="span2">
                                <span class="line"></span>
                                Total amount
                            </th>
                            <th class="span1">
                                <span class="line"></span>
                                Status
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                Operation
                            </th>
                        </tr>
                        </thead>
                        <tbody data-bind="foreach: {data: orderArray, as: 'order'}">

                        <tr class="first">
                            <td class="span2">
                                <span data-bind="text: order.orderId"></span>
                            </td>
                            <td class="span2">
                                <span data-bind="text: order.createTime"></span>
                            </td>
                            <td class="span1">
                                <span data-bind="text: order.address.consignee"></span>
                            </td>
                            <td class="span2">
                                <span class="label label-success" data-bind="text: order.payMethod">Pay Online</span>
                            </td>
                            <td class="span2">
                                $<span data-bind="text: order.totalPrice"></span>
                            </td>
                            <td class="span1">
                                <span data-bind="text: order.status"></span>
                            </td>
                            <td class="span3">
                                <a href="">Detail</a>
                                <!-- ko if: order.status == 'Unconfirmed'-->
                                <a href="">Confirm</a>
                                <!-- /ko -->
                                <!-- ko if: order.status == 'Confirmed'-->
                                <a href="">Ship</a>
                                <!-- /ko -->
                                <!-- ko if: order.status == 'Deleted' || order.status == 'Canceled'-->
                                <a href="">Delete</a>
                                <!-- /ko -->
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="wizard-actions" style="text-align: center">
                    <button type="button" class="btn btn-success btn-mini" data-bind="click: prevPage">
                        <i class="icon-chevron-left"></i> Prev
                    </button>
                    <span style="font-size: 16px" data-bind="text: currentPage() + '/' + totalPage()"></span>
                    <button type="button" class="btn btn-success btn-mini" data-last="Finish" data-bind="click: nextPage">
                        Next <i class="icon-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function orderPage() {
        var self = this;

        self.allClass = ko.observable();
        self.payClass = ko.observable();
        self.unConfirmClass = ko.observable();
        self.confirmClass = ko.observable();
        self.deliverClass = ko.observable();
        self.finishClass = ko.observable();
        self.deleteClass = ko.observable();
        self.cancelClass = ko.observable();


        self.orderArray = ko.observableArray();
        self.currentPage = ko.observable(1);
        self.pageSize = ko.observable();
        self.count = ko.observable();
        self.totalPage = ko.observable();
        self.currentStatus = ko.observable();
        self.countTotalPage = function () {
            if (self.count() <= self.pageSize()) {
                self.totalPage(1);
            } else {
                self.totalPage(Math.floor(self.count() / self.pageSize()));
            }
        };
        self.prevPage = function () {
            if (self.currentPage() == 1) {
                return
            }
            self.currentPage(self.currentPage() - 1);
            self.getOrderByStatus();
        };
        self.nextPage = function () {
            if (self.currentPage() == self.totalPage()) {
                return
            }
            self.currentPage(self.currentPage() + 1);
            self.getOrderByStatus();
        };
        self.getOrderByStatus = function (status) {
            if (self.currentStatus() != status) {
                self.clearClass();
                switch (status) {
                    case 10: self.allClass('active');break;
                    case -2: self.payClass('active');break;
                    case -1: self.cancelClass('active');break;
                    case 0: self.unConfirmClass('active');break;
                    case 1: self.confirmClass('active');break;
                    case 2: self.deliverClass('active');break;
                    case 3: self.finishClass('active');break;
                    case 5: self.deleteClass('active');break;
                }
            }
            self.currentStatus(status);

            var  url = "/merchant/order/by_status?page=" + self.currentPage();
            if (self.currentStatus() != 10) {
                url = url + "&status=" + self.currentStatus();
            }
            $.get(url, function (json) {
                if (json['success']) {
                    self.orderArray(json['orderArray']);
                    self.pageSize(json['pageSize']);
                    self.count(json['count']);
                    self.countTotalPage();
                }
            });
        };
        self.clearClass = function () {
            self.allClass('');
            self.payClass('');
            self.cancelClass('');
            self.unConfirmClass('');
            self.confirmClass('');
            self.deliverClass('');
            self.finishClass('');
            self.deleteClass('');
        };
        (function () {
            self.getOrderByStatus(10);
        })();
    }
    ko.applyBindings(new orderPage());
</script>
</html>