<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>Detail Admin - Sign in</title>

    <!-- bootstrap -->
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/signin.css" type="text/css" media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-2.1.1.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
</head>
<body>
<div class="row-fluid login-wrapper">
    <a href="index.html">
        <img class="logo" src="<%request.getContextPath();%>/backend/img/logo-white.png"/>
    </a>

    <div class="span4 box">
        <div class="content-wrap">
            <h6>Log in</h6>
            <div><span class="login_errorMessage" data-bind="text: errorMessage"></span></div>
            <input class="span12" data-bind="value: email" type="text" placeholder="E-mail address"/>
            <input class="span12" data-bind="value: password" type="password" placeholder="Your password"/>
            <a href="#" class="forgot">Forgot password?</a>

            <div class="remember">
                <input id="remember-me" type="checkbox"/>
                <label for="remember-me">Remember me</label>
            </div>
            <a class="btn-glow primary login" data-bind="click: loginFunction">Log in</a>
        </div>
    </div>
</div>
<script type="text/javascript">
    function loginPage() {
        var self = this;
        self.email = ko.observable();
        self.password = ko.observable();
        self.errorMessage = ko.observable();

        self.loginFunction = function () {
            $.get("/merchant/login?email=" + self.email() + "&password=" + self.password(), function(result) {
                if (result['success'] == 1) {
                    window.location.href = '/merchant/home';
                } else {
                    self.errorMessage(result['msg']);
                }
            })
        }
    }
    ko.applyBindings(new loginPage());
</script>
</body>
</html>