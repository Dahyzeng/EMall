<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>Detail Admin - Sign in</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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

    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>

    <!-- pre load bg imgs -->
    <script type="text/javascript">
        $(function () {
            // bg switcher
            var $btns = $(".bg-switch .bg");
            $btns.click(function (e) {
                e.preventDefault();
                $btns.removeClass("active");
                $(this).addClass("active");
                var bg = $(this).data("img");

                $("html").css("background-image", "url('img/bgs/" + bg + "')");
            });

        });
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>


<!-- background switcher -->
<div class="bg-switch visible-desktop">
    <div class="bgs">
        <a href="#" data-img="landscape.jpg" class="bg active">
            <img src="<%request.getContextPath();%>/backend/img/bgs/landscape.jpg"/>
        </a>
        <a href="#" data-img="blueish.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/blueish.jpg"/>
        </a>
        <a href="#" data-img="7.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/7.jpg"/>
        </a>
        <a href="#" data-img="8.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/8.jpg"/>
        </a>
        <a href="#" data-img="9.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/9.jpg"/>
        </a>
        <a href="#" data-img="10.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/10.jpg"/>
        </a>
        <a href="#" data-img="11.jpg" class="bg">
            <img src="<%request.getContextPath();%>/backend/img/bgs/11.jpg"/>
        </a>
    </div>
</div>


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