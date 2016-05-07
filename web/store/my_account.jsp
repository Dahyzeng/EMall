<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>My Account</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=request.getContextPath() %>/store/css/bootstrap/bootstrap.combined.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/grid.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/account.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath() %>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/knockoutjs.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<section style="margin: 40px;">
    <div class="container_12" id="account_content">
        <div id="content">
            <div class="tabbable tabs-left" id="tabs-528944">
                <ul class="nav nav-tabs" style="list-style: none">
                    <li class="active">
                        <a href="#personalInfoTab" data-toggle="tab">Personal Info</a>
                    </li>
                    <li>
                        <a href="#addressTab" data-toggle="tab">Address</a>
                    </li>
                    <li>
                        <a href="#orderTab" data-toggle="tab">Order</a>
                    </li>
                </ul>
                <div class="tab-content" id="account_tab-content">
                    <div class="tab-pane active" id="personalInfoTab">
                        <jsp:include page="account/personal_info.jsp"/>
                    </div>
                    <div class="tab-pane" id="addressTab">
                        <p>
                            Address
                        </p>
                    </div>
                    <div class="tab-pane" id="orderTab">
                        <p>
                            Order
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<div style="margin-top: 400px">
<jsp:include page="common/footer.jsp"/>
</div>
</body>
<script>
    function accountPage() {
        var self = this;
        self.userInfo = ko.observable();
        self.addressArray = ko.observableArray();
        self.orderArray = ko.observableArray();
        (function () {
            headerPage();
            $.get("/profile/account", function(json) {
                if (json['success']) {
                    self.userInfo(json['personalInfo']);
                    self.addressArray(json['addressArray']);
                    self.orderArray(json['orderArray']);
                }
            })
        })();
    }
    ko.applyBindings(new accountPage());
</script>
</html>
