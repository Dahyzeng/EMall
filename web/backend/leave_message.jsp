<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Leave Message</title>
    <!-- bootstrap -->
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/message.css"/>

    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.js"></script>

    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>

</head>

<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>


<div class="content">

    <div class="contentHeader">
        <h1 class="page-title">Leave Message</h1>
        <input type="hidden" id="itemId" value="${requestScope.itemId}"/>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li class="active">Leave Message</li>
    </ul>

    <div class="container-fluid">
        <%--<div class="status">--%>
            <%--<!-- ko if: status() == 0 -->--%>
            <%--<a href="#" class="btn btn-small active">New</a>--%>
            <%--<a href="#" class="btn btn-small" data-bind="click: changeStatus.bind($data, 1)" style="margin-left: 30px">Read</a>--%>
            <%--<!-- /ko -->--%>
            <%--<!-- ko if: status() == 1 -->--%>
            <%--<a href="#" class="btn btn-small" data-bind="click: changeStatus.bind($data, 0)" >New</a>--%>
            <%--<a href="#" class="btn btn-small active"style="margin-left: 30px">Read</a>--%>
            <%--<!-- /ko -->--%>
        <%--</div>--%>
        <div class="divide"></div>

        <div class="message">
            <ul class="content_panel" data-bind="foreach: { data: messageArray, as: 'message'}">
                <li class="panel_style">
                    <div data-bind="attr: {class: 'panel ' + $root.panelClassArray()[parseInt(4*Math.random())]}" style="height: 200px">
                        <div class="panel-heading">
                            <h4 class="panel-title" data-bind="text: message.name"></h4>
                        </div>

                        <div class="panel-body">
                            <span data-bind="text: message.content"></span>
                        </div>
                        <div style="padding-top: 68px">
                            <span data-bind="text: message.email"></span>
                            <span data-bind="text: message.telephone" style="float: right"></span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

</body>
<script>
    function leaveMessagePage() {
        var self = this;
        self.panelClassArray = ko.observableArray(['panel-info', 'panel-primary', 'panel-success', 'panel-warning', 'panel-danger']);
        self.status = ko.observable(0);
        self.page = ko.observable(1);
        self.messageArray = ko.observableArray();

        self.changeStatus = function (p) {
            self.status(p);
            $.get("/leave_message/get?page=" + self.page() + "&status=" + self.status(), function (json) {
                if (json['success']) {
                    self.messageArray(json['messages']);
                }
            });
        };

        (function () {
            $.get("/leave_message/get?page=" + self.page() + "&status=" + self.status(), function (json) {
                if (json['success']) {
                    self.messageArray(json['messages']);
                }
            });
        })();
    }
    ko.applyBindings(new leaveMessagePage());
</script>
</html>