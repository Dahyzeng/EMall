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
        <h1 class="page-title">Product</h1>
        <input type="hidden" id="itemId" value="${requestScope.itemId}"/>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li><a href="/merchant/product" style="color: #0088cc">Product</a> <span class="divider">/</span></li>
        <li class="active">添加图片</li>
    </ul>

    <div class="container-fluid">
        <div><h3>添加图片</h3><h5>(最多允许5张图片)</h5></div>
        <div id="pad-wrapper" class="gallery">
            <div class="gallery-wrapper">
                <div class="row gallery-row" data-bind="foreach: { data: itemPicURLArray, as: 'itemPic'}">
                    <div class="span3 img-container">
                        <div class="img-box">
                                <span class="icon trash" data-bind="click: $root.deletePic">
                                    <i class="gallery-trash"></i>
                                </span>
                            <img data-bind="attr: {src: itemPic.picURL}"/>

                            <%--<p class="title">--%>
                                <%--Beach pic title--%>
                            <%--</p>--%>
                        </div>
                    </div>
                </div>
                <div class="img-container" style="width: 100px; height: 100px">
                    <img src="<%request.getContextPath();%>/backend/img/new-gallery-img.png" title="add a pic" onclick="callModal()"/>
                </div>
            </div>
        </div>
        <div id="add_pic" class="modal hide fade" role="dialog" aria-labelledby="Add A Pic" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3>
                    Upload a pic
                </h3>
            </div>
            <form action="/item/add_pic/${requestScope.itemId}" method="post" enctype="multipart/form-data">
                <div class="field-box">
                    <label style="float: left">Choose A Pic:</label>
                    <input type="file" name="file" accept="image/jpeg,image/png,image/bmp,image/jpg"/>
                </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" id="fatherClose" aria-hidden="true">close</button>
                <input type="submit" class="btn btn-primary" value="upload"/>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
    function itePicPage() {
        var self = this;
        self.itemPicURLArray = ko.observableArray();
        self.message = ko.observable();
        self.deletePic = function (p) {
            $.get("/item/delete_pic/" + p.itemId + "?picURL=" + p.picURL, function (returnJson) {
                   if (returnJson['success']) {
                       self.itemPicURLArray.remove(p);
                   } else {
                       self.message(returnJson['errorMessage']);
                   }
            })
        };
        (function () {
            var itemId = $("#itemId").val();
            $.get("/item/get_pic/" + itemId, function (picJson) {
                if (picJson['success']) {
                    self.itemPicURLArray(picJson['itemPic']);
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