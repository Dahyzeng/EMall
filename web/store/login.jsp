<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Login</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=request.getContextPath() %>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath() %>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath() %>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/html5.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/jflow.plus.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/checkbox.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/radio.js"></script>
    <script src="<%=request.getContextPath() %>/store/js/selectBox.js"></script>
    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#myController").jFlow({
                controller: ".control", // must be class, use . sign
                slideWrapper: "#jFlowSlider", // must be id, use # sign
                slides: "#slider", // the div where all your sliding divs are nested in
                selectedWrapper: "jFlowSelected", // just pure text, no sign
                width: "984px", // this is the width for the content-slider
                height: "480px", // this is the height for the content-slider
                duration: 400, // time in miliseconds to transition one slide
                prev: ".slidprev", // must be class, use . sign
                next: ".slidnext", // must be class, use . sign
                auto: true
            });
        });
    </script>
    <script>
        $(function () {
            $('#list_product').carouFredSel({
                prev: '#prev_c1',
                next: '#next_c1',
                auto: false
            });
            $('#list_product2').carouFredSel({
                prev: '#prev_c2',
                next: '#next_c2',
                auto: false
            });
            $('#list_banners').carouFredSel({
                prev: '#ban_prev',
                next: '#ban_next',
                scroll: 1,
                auto: false
            });
            $(window).resize();
        });
    </script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $(this).addClass('click')
            });
        })
    </script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">Login or Create an Account</h1>
            </div>
            <!-- .grid_12 -->
            <div class="grid_6 new_customers">
                <h2>New Customers</h2>

                <p>By creating an account with our store, you will be able to move through the checkout process faster,
                    store multiple shipping addresses, view and track your orders in your account and more.</p>

                <div class="clear"></div>
                <button class="account">Create An Account</button>
            </div>
            <!-- .grid_6 -->
            <div class="grid_6">
                <form class="registed">
                    <h2>Registed Customers</h2>

                    <p>If you have an account with us, please log in.</p>

                    <div class="email">
                        <strong>Email Adress:</strong><sup class="surely">*</sup>
                        <br/>
                        <input type="email" name="" class="" value=""/>
                    </div>
                    <!-- .email -->
                    <div class="password">
                        <strong>Password:</strong><sup class="surely">*</sup>
                        <br/>
                        <input type="text" name="" class="" value=""/>
                        <a class="forgot" href="#">Forgot Your Password?</a>
                    </div>
                    <!-- .password -->
                    <div class="remember">
                        <input class="niceCheck" type="checkbox" name="Remember_password"/>
                        <span class="rem">Remember password</span>
                    </div>
                    <!-- .remember -->
                    <div class="submit">
                        <input type="submit" class="login" value="Login"/>
                        <sup class="surely">*</sup><span>Required Field</span>
                    </div>
                    <!-- .submit -->
                </form>
                <!-- .registed -->
            </div>
            <!-- .grid_6 -->
        </div>
        <!-- #content -->
        <div class="clear"></div>
    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>

</html>

