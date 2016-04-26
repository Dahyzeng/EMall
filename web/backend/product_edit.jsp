<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
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
        <li><a href="/merchant/product" style="color: #0088cc">Product</a> <span class="divider">/</span></li>
        <li class="active">edit</li>
    </ul>


    <div class="container-fluid">
        <div><h3>${requestScope.operationMessage}</h3></div>
        <div id="pad-wrapper" class="form-page">
            <div class="row-fluid form-wrapper">
                <div class="span8 column">
                    <form action="/item/add" data-bind="submit: beforeSubmit" enctype="multipart/form-data" method="post">
                        <div class="field-box">
                            <label>Item Name:</label>
                            <input class="span8 inline-input" value="${requestScope.item.itemName}" name="itemName" placeholder="item name" type="text"/>
                        </div>
                        <div class="field-box">
                            <label>Inventory:</label>
                            <input class="span8 inline-input" value="${requestScope.item.inventory}" name="inventory" placeholder="inventory" type="text"/>
                        </div>
                        <div class="field-box">
                            <label>Price:</label>
                            <input class="span8 inline-input" value="${requestScope.item.price}" name="price" type="text" placeholder="price"/>
                        </div>
                        <div class="field-box">
                            <label>Discount:</label>
                            <input class="span8 inline-input" value="${requestScope.discount}" name="discount" type="text" placeholder="price"/>
                        </div>

                        <div class="field-box">
                            <label>Category:</label>
                            <input type="hidden" name="categoryId" value="${requestScope.item.categoryId}" id="categoryId"/>
                            <select data-bind="options: categoryArray, optionsText: 'firstCategoryName', value: firstCategoryValue, optionsCaption: 'select a category'"></select>
                            <span id="childCategory"><span data-bind="with: firstCategoryValue"><select data-bind="options: childCategories, optionsText: 'categoryName', value: $root.secondCategoryValue, optionsCaption: 'select a category'"></select></span></span>
                        </div>

                        <div class="field-box">
                            <label>Show Picture:</label>
                            <input class="span8" type="file" name="file" accept="image/jpeg,image/png,image/bmp,image/jpg"/>
                        </div>
                        <div class="field-box">
                            <label>Textarea:</label>
                            <textarea name="description" class="span8" rows="4">${requestScope.item.description}</textarea>
                        </div>
                        <input type="hidden" name="itemId" value="${requestScope.item.itemId}">
                        <input type="submit" value="Save"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function productEditPage() {
        var self = this;
        self.categoryArray = ko.observableArray();
        self.returnMessage = ko.observable();
        self.firstCategoryValue = ko.observable();
        self.secondCategoryValue = ko.observable();
        self.firstCategoryValue.subscribe(function() {
            if (self.firstCategoryValue().childCategories.length == 0) {
                $('#childCategory').attr('class','hidden');
            } else {
                $('#childCategory').removeAttr('class');
            }
        });
        (function() {
            $.get("/category/getAll", function(responseArray){
                if (responseArray['success']) {
                    var tmpArray = responseArray['categoryArray'];
                    for (var i = 0; i < tmpArray.length; i++) {
                        self.categoryArray.push({firstCategoryName: tmpArray[i]['fatherCategory']['categoryName'], firstCategoryId: tmpArray[i]['fatherCategory']['categoryId'], childCategories: tmpArray[i]['childCategories']});
                    }
                } else {
                    self.returnMessage(responseArray['errorMessage']);
                }
            })
        })();
        self.beforeSubmit = function() {
            if ($('#categoryId').val()) {
                return true;
            }
            if (self.firstCategoryValue() && self.secondCategoryValue()) {
                $('#categoryId').val(self.secondCategoryValue().categoryId);
            } else if (!self.secondCategoryValue()) {
                $('#categoryId').val(self.firstCategoryValue().firstCategoryId);
            }
            return true;
        };
    }
    ko.applyBindings(new productEditPage())
</script>
</body>
</html>