<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/compiled/form-showcase.css"/>
    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/tables.css" type="text/css"

          media="screen"/>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
    <script type="text/javascript" src="<%request.getContextPath();%>/backend/js/jquery-ui-datepicker.js"></script>


    <script charset="utf-8" src="<%request.getContextPath();%>/backend/js/editor/plugins/code/prettify.js"></script>
    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/js/editor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="<%request.getContextPath();%>/backend/js/editor/kindeditor.js"></script>
    <script charset="utf-8" src="<%request.getContextPath();%>/backend/js/editor/lang/zh_CN.js"></script>

    <script type="text/javascript">

        var editor;

        $(function () {
            $("#date_1").datepicker();

        });
        KindEditor.ready(function (K) {

            var options = {
                cssPath: '../../editor/plugins/code/prettify.css',
                uploadJson: './global/upload_json.jsp',
                fileManagerJson: './global/file_manager_json.jsp',
                allowFileManager: false,
                allowImageManager : true,
                resizeType: 0,
                items: [
                    'undo', 'redo', '|', 'preview', 'print', 'cut', 'copy', 'paste',
                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', '|', 'image', 'fullscreen',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|',
                    'table', 'hr'
                ],

                afterCreate: function () {
                    this.sync();
                },
                afterBlur: function () {
                    this.sync();
                }
            };
            editor = K.create('textarea', options);
            editor.sync();
            KindEditor.options.minWidth = 950;
            KindEditor.options.minWidth = 900;
            KindEditor.options.resizeType = 0;
        });
        prettyPrint();


        //把txtsummary附给input value
        function getSummary() {
            document.getElementById("summary").value = editor.text().substring(0, 60);
        }
        function getSum(){
//            alert(editor.text().substring(0, 60));
            document.getElementById("summary").value = editor.text().substring(0, 60);
        }

    </script>

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
                        <c:if test="${requestScope.operation ne 'add'}">
                        <div class="field-box">
                            <label>Discount:</label>
                            <input class="span8 inline-input" value="${requestScope.item.discount}" name="discount" type="text" placeholder="price"/>
                        </div>
                        </c:if>
                        <c:if test="${requestScope.operation eq 'add'}">
                            <input type="hidden" name="discount" value="0"/>
                        </c:if>
                        <div class="field-box">
                            <label>Category:</label>
                            <input type="hidden" name="categoryId" value="${requestScope.item.categoryId}" id="categoryId"/>
                            <!-- ko ifnot: itemCategoryName -->
                            <select data-bind="options: categoryArray, optionsText: 'firstCategoryName', value: firstCategoryValue, optionsCaption: 'select a category'"></select>
                            <span id="childCategory"><span data-bind="with: firstCategoryValue"><select data-bind="options: childCategories, optionsText: 'categoryName', value: $root.secondCategoryValue, optionsCaption: 'select a category'"></select></span></span>
                            <!-- /ko -->
                            <!-- ko if: itemCategoryName -->
                                ${requestScope.itemCategoryName}
                                <a href="#" data-bind="click: changeItemCategory">change</a>
                            <!-- /ko -->
                        </div>

                        <div class="field-box">
                            <label>Show Picture:</label>
                            <input class="span8" type="file" name="file" accept="image/jpeg,image/png,image/bmp,image/jpg"/>
                        </div>
                        <div class="field-box">
                            <label>Textarea:</label>
                            <textarea id="editor_id" name="description" style="width:900px;height:500px;" onfocus="getSum()" onchange="getSum()">
                                ${requestScope.item.description}
	                        </textarea>
                        </div>

                        <c:if test="${requestScope.item.itemId ne null}">
                            <input type="hidden" name="itemId" value="${requestScope.item.itemId}">
                        </c:if>
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
        self.itemCategoryName = ko.observable("${requestScope.itemCategoryName}");
        self.firstCategoryValue.subscribe(function() {
            if (self.firstCategoryValue().childCategories.length == 0) {
                $('#childCategory').attr('class','hidden');
            } else {
                $('#childCategory').removeAttr('class');
            }
        });
        self.changeItemCategory = function () {
            self.itemCategoryName("");
        };
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
        self.beforeSubmit = function(p) {
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