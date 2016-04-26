<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Register</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/laydate/laydate.js"></script>
    <script src="<%request.getContextPath();%>/store/js/html5.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jflow.plus.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/checkbox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">Create an Account</h1>
            </div>
            <div><span data-bind="text: message"></span></div>
            <!-- .grid_6 -->
            <div class="grid_12">
                <form class="registed" style="height:300px">
                    <div class="grid_5">
                        <div>
                            <strong>Username</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" data-bind="value: registerName" name="username"/>
                        </div>
                        <div class="email">
                            <strong>Email Adress:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="email" data-bind="value: registerEmail"/>
                        </div>
                        <div>
                            <strong>Gender:</strong><sup class="surely">*</sup><br/>
                            <input type="radio" name="gender" value="male"/>male&nbsp&nbsp&nbsp&nbsp&nbsp
                            <input type="radio" name="gender" value="female"/>female
                        </div>

                        <div class="submit">
                            <input type="button" data-bind="click: registerSubmit" class="register" value="Create An Account"/>
                        </div>
                    </div>
                    <div class="grid_6">
                        <div class="password">
                            <strong>Password:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="password" data-bind="value: registerPassword" name="" class="" />
                        </div>
                        <div class="password">
                            <strong>Password Confirm:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="password" data-bind="value: passwordConfirm"/>
                        </div>
                        <div>
                            <strong>Birthday:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" class="laydate-icon" name="birthday" onclick="laydate()"><br/>
                        </div>
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
    function registerPage() {
        var self = this;
        self.registerName = ko.observable();
        self.registerEmail = ko.observable();
        self.registerPassword = ko.observable();
        self.passwordConfirm = ko.observable();
        self.message = ko.observable();
        self.registerSubmit = function () {
            var gender = $("input[name='gender']:checked").val();
            var birthday = $("input[name='birthday']").val();
            $.post("/profile/register", {username: self.registerName(), email: self.registerEmail(), password: self.registerPassword(),  gender: gender, birthday: birthday},
            function (resultJson) {
                if (resultJson['success']) {
                    window.location.href = '/home';
                } else {
                    self.message(resultJson['message']);
                }
            })
        };
        (function() {
            headerPage();
        })();
    }
    ko.applyBindings(new registerPage());
</script>
</html>
