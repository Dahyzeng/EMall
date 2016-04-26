<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/compiled/form-showcase.css"/>

    <!-- libraries -->
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/gallery.css" type="text/css" media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>

    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
</head>

<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>


<div class="content">

    <div class="contentHeader">
        <h1 class="page-title">Product</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li><a href="/merchant/product" style="color: #0088cc">Product</a> <span class="divider">/</span></li>
        <li class="active">Home Page Carouse</li>
    </ul>

    <div class="container-fluid">
        <div><h3>Set home page carouse pic</h3></div>
        <div>
            <form action="/carousel/add" method="post" enctype="multipart/form-data">
                <div class="field-box">
                    <label>sequence:</label>
                    <select class="span8 inline-input" name="sequence">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="field-box">
                    <label>choose a picture:</label>
                    <input class="span8" type="file" name="file" accept="image/jpeg,image/png,image/bmp,image/jpg"/>
                </div>
                <input type="hidden" id="itemId" name="itemId" value="${requestScope.itemId}">
                <input type="submit" value="Save"/>
            </form>
        </div>
        <div id="pad-wrapper" class="gallery">
            <div class="gallery-wrapper">
                <div class="row gallery-row" data-bind="foreach: { data: itemPicURLArray, as: 'itemPic'}">
                    <div class="span3 img-container">
                        <div class="img-box">
                                <span class="icon trash" data-bind="click: $root.deletePic">
                                    <i class="gallery-trash"></i>
                                </span>
                            <img data-bind="attr: {src: itemPic.picURL}"/>

                            <p class="title">
                                <span data-bind="text: itemPic.itemName"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function itePicPage() {
        var self = this;
        self.itemPicURLArray = ko.observableArray();
        self.message = ko.observable();
        self.deletePic = function (p) {
            $.post("/carousel/delete", { itemId: p.itemId, itemName: p.itemName}, function (returnJson) {
                if (returnJson['success']) {
                    self.itemPicURLArray.remove(p);
                } else {
                    self.message(returnJson['errorMessage']);
                }
            })
        };
        (function () {
            var itemId = $("#itemId").val();
            $.get("/carousel/get", function (picJson) {
                if (picJson['success']) {
                    self.itemPicURLArray(picJson['carouseArray']);
                } else {
                    self.message(picJson['errorMessage']);
                }
            })
        })()
    }
    ko.applyBindings(new itePicPage())
</script>
</body>
</html>