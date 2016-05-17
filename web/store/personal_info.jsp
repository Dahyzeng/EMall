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
    <script src="<%request.getContextPath();%>/store/js/laydate/laydate.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/knockoutjs.js"></script>
</head>
<body>
<div id="main_part">
    <jsp:include page="common/header.jsp"/>

    <div class="container_12">
        <div class="grid_12">
            <div class="breadcrumbs">
                <a href="/home">Home</a><span>&#8250;</span>
                <span class="current">Personal Info</span>
            </div>
        </div>
    </div>
    <section style="margin: 60px;">
        <div class="container_12" id="account_content">
            <div>
                <div class="tabbable tabs-left" id="tabs-528944">
                    <ul class="nav nav-pills nav-stacked" id="account_menu">
                        <li class="active"><a href="#">Personal Info</a></li>
                        <li><a href="/account/address">Address</a></li>
                        <li><a href="/account/order">Order</a></li>
                    </ul>
                    <div class="info_content">
                        <div class="p_inside">
                            <div class="personal_info_content">
                                <div class="p_label">
                                    <div class="p_property">
                                        <sup class="surely"
                                             style="vertical-align:middle">*</sup><strong>Username:</strong>
                                    </div>
                                </div>
                                <input type="text" data-bind="value: userInfo().username"/>
                            </div>
                            <div class="personal_info_content">
                                <div class="p_label">
                                    <div class="p_property">
                                        <sup class="surely" style="vertical-align:middle">*</sup><strong>Email:</strong>
                                    </div>
                                </div>
                                <span data-bind="text: userInfo().email"></span>
                                <a href="#" data-bind="click: showAddressModal" style="text-decoration:none; float: right; padding-right: 20px">change</a>
                            </div>
                            <div class="personal_info_content">
                                <div class="p_label">
                                    <div class="p_property">
                                        <sup class="surely" style="vertical-align:middle">*</sup><strong>Birthday:</strong>
                                    </div>
                                </div>
                                <input type="text" class="laydate-icon" name="birthday" data-bind="value: userInfo().birthday" onclick="laydate()"><br/>
                            </div>
                            <div class="personal_info_content">
                                <div class="p_label">
                                    <div class="p_property">
                                        <sup class="surely"
                                             style="vertical-align:middle">*</sup><strong>Gender:</strong>
                                    </div>
                                </div>
                                <input type="radio" value="male" style="margin: 0" name="gender">male</input>
                                <input type="radio" value="female" style="margin: 0 0 0 20px; " name="gender">female</input>
                            </div>
                            <div class="personal_info_content">
                                <div class="p_label">
                                    <div class="p_property">
                                        <sup class="surely"
                                             style="vertical-align:middle">*</sup><strong>password:</strong>
                                    </div>
                                </div>
                                <span>************</span>
                                <a href="#" data-bind="click: showAddressModal" style="text-decoration:none; float: right; padding-right: 20px">change</a>
                            </div>

                            <div class="personal_info_content">
                                <button style="margin-left: 100px; width: 70px; margin-bottom: 20px" data-bind="click: updateInfo">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </section>
    <div>
        <jsp:include page="common/footer.jsp"/>
    </div>
</div>
<div id="password_modal" class="info_modal">
    <div class="inner">
        <div class="modal_title">
            <span>Update Password</span>
            <span class="modal_close"><a href="#" data-bind="click: passwordModalClose">X</a></span>
        </div>

        <div class="info_modal_content">
            <div><span data-bind="text: passwordUpdateMessage"></span></div>
            <div style="margin-left: 50px; margin-top: 30px;">
                <div style="margin-bottom: 30px">
                    <div style="width: 115px; float: left">
                        <strong style="float: right">Old Password:</strong>
                    </div>
                    <input type="password" style="margin-left: 30px; height: 25px" data-bind="value: oldPassword" name="password"/>
                </div>

                <div style="margin-bottom: 30px">
                    <div style="width: 115px; float: left">
                        <strong style="float: right">New Password:</strong>
                    </div>
                    <input type="password" style="margin-left: 30px; height: 25px" data-bind="value: newPassword" name="password"/>
                </div>

                <div style="margin-bottom: 10px">
                    <div style="width: 115px; float: left">
                        <strong style="float: right">Confirm Password:</strong>
                    </div>
                    <input type="password" style="margin-left: 30px; height: 25px" data-bind="value: confirmPassword" name="password"/>
                </div>
                <div style="margin-left: 145px">
                    <button style="width: 200px" data-bind="click: updatePassword">Update</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function openPasswordModal() {
        $('#password_modal').css('display', 'block');
        $('#main_part').css('opacity', '0.5');
    }
    function closePasswordModal() {
        $('#password_modal').css('display', 'none');
        $('#main_part').css('opacity', '');
    }
    function accountPage() {
        var self = this;
        self.userInfo = ko.observable({});
        self.oldPassword = ko.observable();
        self.newPassword = ko.observable();
        self.confirmPassword = ko.observable();
        self.passwordUpdateMessage = ko.observable();

        self.showAddressModal = function () {
            openPasswordModal();
        };
        self.passwordModalClose = function () {
            closePasswordModal();
            self.clearAll();
            self.passwordUpdateMessage("");
        };

        self.updateInfo = function () {
            self.userInfo().gender = $('input[name="gender"]').val();
            $.post("/profile/update", {username: self.userInfo().username, gender:self.userInfo().gender, birthday: self.userInfo().birthday}, function (json) {
                if (json['success']) {
                    alert("update successful");
                } else {
                    alert("update fail");
                }
            })
        };

        self.updatePassword = function () {
            if (self.confirmPassword() != self.newPassword()) {
                self.passwordUpdateMessage("confirm password and new password do not match!");
                return
            }
            if (!self.newPassword()) {
                self.passwordUpdateMessage("new password can be empty");
                return
            }
            $.post("/profile/update_password", {oldPassword: self.oldPassword(), newPassword: self.newPassword()}, function (json) {
                if (json['success']) {
                    self.passwordUpdateMessage("update successful");
                    self.clearAll();
                } else {
                    self.passwordUpdateMessage(json['errorMessage']);
                }
            })
        };

        self.clearAll = function () {
            self.oldPassword('');
            self.newPassword('');
            self.confirmPassword('');
        };
        (function () {
            headerPage();
            $.get("/profile/account", function (json) {
                if (json['success']) {
                    self.userInfo(json['personalInfo']);
                }
            })
        })();
    }
    ko.applyBindings(new accountPage());
</script>
</html>
