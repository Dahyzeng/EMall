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
    <title>Register</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/laydate/laydate.js"></script>
    >
    <script src="js/html5.js"></script>
    <script src="js/jflow.plus.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/checkbox.js"></script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">Create an Account</h1>
            </div>
            <!-- .grid_6 -->
            <div class="grid_12">
                <form class="registed" style="height:300px">
                    <div class="grid_5">
                        <div>
                            <strong>Username</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" name="username"/>
                        </div>
                        <div class="email">
                            <strong>Email Adress:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="email" name="" class="" value=""/>
                        </div>
                        <div>
                            <strong>Gender:</strong><sup class="surely">*</sup><br/>
                            <input type="radio" name="gender" value="male"/>male&nbsp&nbsp&nbsp&nbsp&nbsp
                            <input type="radio" name="gender" value="female"/>female
                        </div>
                        <!-- .remember -->
                        <div class="submit">
                            <input type="submit" class="register" value="Create An Account"/>
                        </div>
                    </div>
                    <div class="grid_6">
                        <div class="password">
                            <strong>Password:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" name="" class="" value=""/>
                        </div>
                        <div class="password">
                            <strong>Password Confirm:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" name="" class="" value=""/>
                        </div>
                        <div>
                            <strong>Birthday:</strong><sup class="surely">*</sup>
                            <br/>
                            <input type="text" class="laydate-icon" onclick="laydate()"><br/>

                        </div>
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
