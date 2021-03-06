<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Admin - Tables showcase</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->

    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet"/>

    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css"
          rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/category.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/header.css"/>
    <!-- libraries -->
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/tables.css" type="text/css"
          media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/scojs/sco.message.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
    <!-- open sans font -->
</head>
<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>

<div class="content">
    <div class="contentHeader">
        <h1 class="page-title">Category</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li class="active">Category</li>
    </ul>
    <div>
        <div><span data-bind="text: returnMessage"></span></div>
        <a id="modal-651666" href="#modal-container-651666" role="button" class="btn btn-success"
           style="margin-left: 20px;margin-bottom: 30px" data-toggle="modal"><i class="icon-plus"></i>Add New
            Category</a>

        <div id="modal-container-651666" class="modal hide fade" role="dialog" aria-labelledby="addNewCategory"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="addNewCategory">
                    Add Father Category
                </h3>
            </div>
            <div class="modal-body">
                Category Name: <input type="text" data-bind="value: fatherCategoryName" name="fatherCategoryName"/><br/>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" id="fatherClose" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" data-bind="click: addFatherCategory">保存设置</button>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <ul class="categoryPanel" data-bind="foreach: { data: categoryArray, as: 'category'}">
                <li class="li">
                    <div>
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <ul class="fatherpanel">
                                        <li>
                                            <h4 class="panel-title">
                                                <span data-bind="text: category.fatherCategory.categoryName"></span>
                                            </h4>
                                        </li>
                                        <li class="icon" style="margin-left: 10px">
                                            <a href="#modifyCategory" data-bind="click: $root.setModifyCategoryData" data-toggle="modal" title="modify the category name">
                                                <i class="icon-wrench"></i>
                                            </a>
                                        </li>
                                        <li class="icon" style="margin-left: 10px">
                                            <a href="#AddSubCategory" data-bind="click: $root.setSubCategoryFatherId" data-toggle="modal"  title="Add A Sub Category">
                                                <i class="icon-plus"></i>
                                            </a>
                                        </li>
                                        <li class="icon" style="margin-left: 10px">
                                            <a href="#" data-toggle="modal" data-bind="click: $root.deleteCategory" title="Delete the Category">
                                                <i class="icon-remove"></i>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="panel-collapse collapse in" data-bind="foreach: { data: category.childCategories, as: 'childCategory'}">
                                    <div class="panel-body" style="padding: 10px">
                                        <span data-bind="text: childCategory.categoryName"></span>
                                        <a href="#" style="float: right" title="delete this category" data-bind="click: $root.deleteChildCategory">
                                            <i class="icon-remove"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>

<div id="AddSubCategory" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" id="subCategoryClose" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">
            Add A Sub Category
        </h3>
    </div>
    <div class="modal-body">
        <input type="hidden" id="fatherCategoryId" data-bind="value: fatherCategoryId" name="fatherCategoryId"/>
        Sub Category Name: <input type="text" data-bind="value: subCategoryName" name="subCategoryName"/>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-primary" data-bind="click: addSubCategory">Save</button>
    </div>
</div>

<div id="modifyCategory" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" id="modifyClose" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>
            Modify Category Name
        </h3>
    </div>
    <div class="modal-body">
        <input type="hidden" id="modifyCategoryId" data-bind="value: modifyCategoryId" name="modifyCategoryId"/>
        Category Name: <input type="text" data-bind="value: modifyCategoryName" name="modifyCategoryName"/>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-primary" data-bind="click: modifyCategory">Save</button>
    </div>
</div>
<script type="text/javascript">
    function categoryPage() {
        var self = this;
        self.fatherCategoryName = ko.observable();
        self.returnMessage = ko.observable();
        self.fatherCategoryId = ko.observable();
        self.subCategoryName = ko.observable();
        self.modifyCurrentCategoryName = ko.observable();
        self.modifyCategoryName = ko.observable();
        self.modifyCategoryId = ko.observable();
        self.categoryArray = ko.observableArray();
        (function() {
            $.get("/category/getAll", function(responseArray){
                if (responseArray['success']) {
                    self.categoryArray(responseArray['categoryArray']);
                } else {
                    self.returnMessage(responseArray['errorMessage']);
                }
            })
        })();
        self.addFatherCategory = function() {
            $.post("/category/add", {categoryName: self.fatherCategoryName()}, function(responseJson) {
                if (responseJson['success']) {
                    self.categoryArray(responseJson['categoryArray']);
                } else {
                    self.returnMessage(responseJson['errorMessage']);
                }
                $('#fatherClose').trigger('click');
            })
        };

        self.setSubCategoryFatherId = function() {
            self.fatherCategoryId(this.fatherCategory.categoryId)
        };
        self.setModifyCategoryData = function() {
            self.modifyCategoryId(this.fatherCategory.categoryId);
            self.modifyCategoryName(this.fatherCategory.categoryName);
            self.modifyCurrentCategoryName(this.fatherCategory.categoryName);
        };

        self.modifyCategory = function() {
            if (self.modifyCurrentCategoryName() == self.modifyCategoryName()) {
                return;
            }
            $.post("/category/modify", {fatherId: self.fatherCategoryId(), categoryName: self.modifyCategoryName(), categoryId: self.modifyCategoryId()}, function (responseJson) {
                if (responseJson['success']) {
                    self.modifyCategoryId('');
                    self.modifyCategoryName('');
                    self.categoryArray(responseJson['categoryArray']);
                } else {
                    self.returnMessage(responseJson['errorMessage']);
                }
                $('#modifyClose').trigger('click');
            })
        };

        self.deleteCategory = function () {
            $.post("/category/delete", {categoryName: this.fatherCategory.categoryName, categoryId: this.fatherCategory.categoryId}, function(responseJson) {
                if (responseJson['success']) {
                    self.categoryArray(responseJson['categoryArray']);
                } else {
                    self.returnMessage(responseJson['errorMessage']);
                }
            })
        };
        self.deleteChildCategory = function() {
            $.post("/category/delete", {categoryName: this.categoryName, categoryId: this.categoryId, fatherId: this.fatherId}, function(responseJson) {
                if (responseJson['success']) {
                    self.categoryArray(responseJson['categoryArray']);
                } else {
                    self.returnMessage(responseJson['errorMessage']);
                }
            })
        };

        self.addSubCategory = function() {
            $.post("/category/add", {fatherId: self.fatherCategoryId(), categoryName: self.subCategoryName()}, function(responseJson) {
                if (responseJson['success']) {
                    self.fatherCategoryId('');
                    self.subCategoryName('');
                    self.categoryArray(responseJson['categoryArray']);
                } else {
                    self.returnMessage(responseJson['errorMessage']);
                }
                $('#subCategoryClose').trigger('click');
            })
        }
    }
    ko.applyBindings(new categoryPage())
</script>
</body>
</html>