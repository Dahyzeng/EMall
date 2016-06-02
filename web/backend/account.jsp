<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Detail Admin - User list</title>

    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css" />

    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/user-list.css" type="text/css" media="screen" />
    <script src="<%request.getContextPath();%>/backend/js/jquery-2.1.1.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>

<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>
<div class="content">

    <div class="container-fluid">
        <div id="pad-wrapper" class="users-list">
            <div class="row-fluid header">
                <h3>Merchants</h3>
                <div class="span10 pull-right">
                    <a href="#updatePassword" data-toggle="modal" style="text-decoration: none" class="btn btn-success pull-right">
                        Update Password
                    </a>
                    <c:if test="${sessionScope.isAdmin eq 1}">
                        <a href="#addMerchant" data-toggle="modal" style="text-decoration: none; margin-right: 30px" class="btn btn-success pull-right">
                            <span>&#43;</span>
                            NEW USER
                        </a>
                    </c:if>
                </div>
            </div>

            <!-- Users table -->
            <div class="row-fluid table">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="span4 sortable">
                            Name
                        </th>
                        <th class="span3 sortable">
                            <span class="line"></span>Create Time
                        </th>
                        <th class="span2 sortable">
                            <span class="line"></span>Id
                        </th>
                        <th class="span3 sortable">
                            <span class="line"></span>Email
                        </th>
                    </tr>
                    </thead>
                    <tbody data-bind="foreach: {data: merchantArray, as: 'merchant'}">
                    <!-- row -->
                    <tr class="first">
                        <td>
                            <%--<img data-bind="attr: {src: merchant.pic}" class="img-circle avatar hidden-phone" />--%>
                            <a class="name"><span data-bind="text: merchant.merchantName"></span></a>
                        </td>
                        <td>
                            <span data-bind="text: merchant.createTime"></span>
                        </td>
                        <td>
                            <span data-bind="text: merchant.merchantId"></span>
                        </td>
                        <td>
                            <span data-bind="text: merchant.email"></span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div id="addMerchant" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" id="addModalClose" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">
            Add Merchant
        </h3>
    </div>
    <div class="modal-body">
        username: <input type="text" data-bind="value: username" name="subCategoryName"/><br/>
        email: <input type="text" data-bind="value: email" name="subCategoryName"/><br/>
        password: <input type="password" data-bind="value: password" name="subCategoryName"/><br/>
        passwordConfirm: <input type="password" data-bind="value: confirmPassword" name="subCategoryName"/>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-primary" data-bind="click: addAccount">Save</button>
    </div>
</div>
<div id="updatePassword" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" id="updateModalClose" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>
            Update Password
        </h3>
    </div>
    <div class="modal-body">
        old password: <input type="password" data-bind="value: oldPassword"/><br/>
        password: <input type="password" data-bind="value: updatePassword"/><br/>
        passwordConfirm: <input type="password" data-bind="value: updateConfirmPassword"/>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-primary" data-bind="click: onUpdatePassword">Save</button>
    </div>
</div>
</body>
<script>
    function accountPage() {
        var self = this;
        self.username = ko.observable();
        self.email = ko.observable();
        self.oldPassword = ko.observable();
        self.password = ko.observable();
        self.confirmPassword = ko.observable();
        self.updatePassword = ko.observable();
        self.updateConfirmPassword = ko.observable();
        self.merchantArray = ko.observableArray();
        self.addAccount = function () {
            $.post("/merchant/addMerchant", {merchantName: self.username, email:self.email(), password: self.password}, function (json) {
                if (json['success']) {
                    $("#addModalClose").trigger('click');
                }
            });
        };

        self.onUpdatePassword = function () {
            $.post("/merchant/update/password", {password: self.updatePassword()}, function (json) {
                if (json['success']) {
                    $("#updateModalClose").trigger('click');
                }
            })
        };
        (function () {
            $.get("/merchant/getAll", function (json) {
                if (json['success']) {
                    self.merchantArray(json['merchantList']);
                }
            })
        })();
    }
    ko.applyBindings(new accountPage());
</script>
</html>
