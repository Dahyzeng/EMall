<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Admin - Gallery</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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

    <!-- libraries -->
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/gallery.css" type="text/css" media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>

    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>

    <script>
        function callModal() {
            $('#add_pic').modal('show');
        }
    </script>
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
        <div class="status">
            <a href="#" class="btn btn-small active">New</a>
            <a href="#" class="btn btn-small" style="margin-left: 30px">Read</a>
        </div>
        <div class="divide"></div>

        <div class="message">
            <ul class="content_panel">
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>
                <li class="panel_style">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">面板标题</h3>
                        </div>
                        <div class="panel-body">
                            这是一个基本的面板
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>