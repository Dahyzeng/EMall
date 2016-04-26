<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Login</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=request.getContextPath() %>/store/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/grid.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath() %>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/knockoutjs.js"></script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">Login or Create an Account</h1>
            </div>
            <div><span data-bind="text: message"></span></div>
            <div class="grid_6 new_customers">
                <h2>New Customers</h2>

                <p>By creating an account with our store, you will be able to move through the checkout process faster,
                    store multiple shipping addresses, view and track your orders in your account and more.</p>

                <div class="clear"></div>
                <a href="/register" class="btn btn-success">Create An Account</a>
            </div>
            <div class="grid_6">
                <form class="registed">
                    <h2>Registed Customers</h2>

                    <p>If you have an account with us, please log in.</p>

                    <div class="email">
                        <strong>Email Adress:</strong><sup class="surely">*</sup>
                        <br/>
                        <input type="email" data-bind="value: loginEmail"/>
                    </div>
                    <div class="password">
                        <strong>Password:</strong><sup class="surely">*</sup>
                        <br/>
                        <input type="password" data-bind="value: loginPassword"/>
                        <a class="forgot" href="#">Forgot Your Password?</a>
                    </div>
                    <div class="remember">
                        <input class="niceCheck" type="checkbox" name="Remember_password"/>
                        <span class="rem">Remember password</span>
                    </div>
                    <div class="submit">
                        <input type="button" data-bind="click: loginSubmit" class="login" value="Login"/>
                        <sup class="surely">*</sup><span>Required Field</span>
                    </div>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function loginPage() {
        var self = this;
        var url = '${requestScope.url}';
        self.loginEmail = ko.observable();
        self.loginPassword = ko.observable();
        self.message = ko.observable();
        self.loginSubmit = function () {
            $.post("/profile/login", {email: self.loginEmail(), password: self.loginPassword()}, function (resultJson) {
                if (resultJson['success']) {
                    if (url != '') {
                        url = decodeURI(url);
                        window.location.href = url;
                    } else {
                        window.location.href = "/home";
                    }
                } else {
                    self.message(resultJson['message']);
                }
            })
        };
        (function() {
            headerPage();
        })();
    }
    ko.applyBindings(new loginPage());
</script>
</html>

