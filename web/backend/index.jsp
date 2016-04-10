<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Detail Admin - Home</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- libraries -->
    <link href="<%request.getContextPath();%>/backend/css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css"/>
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/index.css" type="text/css" media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>
<div class="content">

    <div class="contentHeader">
        <h1 class="page-title">Help</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="index.html">Home</a></li>
    </ul>
</div>

</body>
</html>
