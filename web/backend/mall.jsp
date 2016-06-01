<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Mall Info</title>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/compiled/form-showcase.css"/>
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/tables.css" type="text/css"

          media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>

<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>

<div class="content">
    <div class="contentHeader">
        <h1 class="page-title">Product</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li class="active">Mall Info</li>
    </ul>
    <div class="container-fluid">
        <div><h3>${requestScope.operationMessage}</h3></div>
        <div id="pad-wrapper" class="form-page">
            <div class="row-fluid form-wrapper">
                <div class="span8 column">
                    <form action="/merchant/update/mall" enctype="multipart/form-data" method="post">
                        <div class="field-box">
                            <label>Mall Name:</label>
                            <input class="span8 inline-input" value="${requestScope.mallInfo.name}" name="name" placeholder="mall name" type="text"/>
                        </div>
                        <div class="field-box">
                            <label>Email:</label>
                            <input class="span8 inline-input" value="${requestScope.mallInfo.email}" name="email" placeholder="email" type="text"/>
                        </div>
                        <div class="field-box">
                            <label>Telephone:</label>
                            <input class="span8 inline-input" value="${requestScope.mallInfo.telephone}" name="telephone" type="text" placeholder="telephone"/>
                        </div>
                        <div class="field-box">
                            <label>Cell Phone:</label>
                            <input class="span8 inline-input" value="${requestScope.mallInfo.cellPhone}" name="cellPhone" type="text" placeholder="cellphone"/>
                        </div>
                        <div class="field-box">
                            <label>Address:</label>
                            <input class="span8 inline-input" value="${requestScope.mallInfo.address}" name="address" type="text" placeholder="address"/>
                        </div>

                        <div class="field-box">
                            <label>Mall LOGO:</label>
                            <input class="span8" type="file" name="file" accept="image/jpeg,image/png,image/bmp,image/jpg"/>
                            <c:if test="${requestScope.mallInfo.storePicURL ne null}">
                                <img src="${requestScope.mallInfo.storePicURL}"/>
                            </c:if>
                            <input type="hidden" name="storePicURL" value="${requestScope.mallInfo.storePicURL}">
                        </div>

                        <input type="hidden" name="id" value="${requestScope.mallInfo.id}">
                        <input type="submit" value="Save"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>