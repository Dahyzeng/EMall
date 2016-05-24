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
        <li class="active">Product</li>
    </ul>
    <c:if test="${requestScope.operationSuccess}">
        <span>Operation success</span>
    </c:if>
    <span data-bind="text: message"></span>

    <div>
        <a href="/merchant/product/add" class="btn btn-success" style="margin-left: 20px;margin-bottom: 30px">
            <i class="icon-plus"></i>
            Add A Product
        </a>
    </div>

    <div class="container-fluid">
        <div id="pad-wrapper" style="margin-top: 10px;">
            <div style="padding-bottom: 20px">
                <!-- ko if: itemStatus() == 1 -->
                <a href="#" class="btn btn-small active">online</a>
                <a href="#" class="btn btn-small" data-bind="click: selectStatus.bind($data, 0)" style="margin-left: 30px">offline</a>
                <!-- /ko -->
                <!-- ko ifnot: itemStatus() == 1 -->
                <a href="#" class="btn btn-small" data-bind="click: selectStatus.bind($data, 1)">online</a>
                <a href="#" class="btn btn-small active" style="margin-left: 30px">offline</a>
                <!-- /ko -->
            </div>
            <div class="table-wrapper products-table section">
                <div class="row-fluid filter-block">
                    <div class="pull-left">
                        filtrate：<br/>
                        <select data-bind="options: categoryArray, optionsText: 'firstCategoryName', value: firstCategoryValue"></select>
                            <span id="childCategory">
                                <span data-bind="with: firstCategoryValue">
                                    <select data-bind="options: childCategories, optionsText: 'categoryName', value: $root.secondCategoryValue"></select>
                                </span>
                            </span>
                    </div>
                </div>


                <div class="row-fluid">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span4">
                                <input type="checkbox"/>
                                Product
                            </th>
                            <th class="span2">
                                <span class="line"></span>Price
                            </th>
                            <th class="span2">
                                <span class="line"></span>inventory
                            </th>
                            <th class="span2">
                                <span class="line"></span>Status
                            </th>
                            <th class="span3">
                                <span class="line"></span>Operation
                            </th>
                        </tr>
                        </thead>
                        <tbody data-bind="foreach: {data: itemArray, as: 'item'}">
                        <tr>
                            <td class="span4">
                                <input type="checkbox"/>

                                <div class="img">
                                    <img data-bind="attr: {src: item.showPicURL}"/>
                                </div>
                                <a href="#" class="name" data-bind="text: item.itemName"></a>
                            </td>
                            <td class="span2">
                                <span data-bind="text: '$' + item.price"></span>
                            </td>
                            <td class="span2">
                                <span data-bind="text: item.inventory"></span>
                            </td>
                            <td class="span2">
                                <!-- ko if: item.status == 0 -->
                                <span ><a href="#" class="btn btn-small btn-success" style="text-decoration: none" data-bind="click: $root.changeItemStatus">Make Online</a></span>
                                <!-- /ko -->
                                <!-- ko if: item.status == 1 -->
                                <span><a href="#" style="text-decoration: none" class="btn btn-small btn-success" data-bind="click: $root.changeItemStatus">Make offline</a></span>
                                <!-- /ko -->
                            </td>
                            <td class="span2">
                                <ul class="actions">
                                    <li>
                                        <a data-bind="attr: { href: '/merchant/product/edit?itemId=' + item.itemId }">Edit</a>
                                    </li>
                                    <li>
                                        <a data-bind="attr: { href: '/merchant/product/pic/' + item.itemId }">Add Picture</a>
                                    </li>
                                    <li>
                                        <a data-bind="attr: { href: '/merchant/product/carousel/' + item.itemId }">Carousel</a>
                                    </li>
                                    <!-- ko if: item.status == 0 -->
                                    <li class="last"><a href="#" data-bind="click: $root.onDelete">Delete</a></li>
                                    <!-- /ko -->
                                </ul>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div>
                    <!-- ko if: hasPage-->
                    <a href="#" data-bind="click: $root.showMoreItem ">show more >></a>
                    <!-- /ko -->
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function productPage() {
        var self = this;
        self.itemStatus = ko.observable(1);
        self.message = ko.observable();
        self.categoryArray = ko.observableArray();
        self.firstCategoryValue = ko.observable();
        self.secondCategoryValue = ko.observable();
        self.itemArray = ko.observableArray();
        self.currentPage = ko.observable(1);
        self.hasPage = ko.observable(true);

        self.selectStatus = function (status) {
            self.currentPage(1);
            self.itemStatus(status);
            self.getFatherCategoryItem(1);
        };
        self.changeItemStatus = function (p) {
            var status = 0;
            if (this.status == 0) {
                status = 1;
            }
            $.post("/item/status", {itemName: this.itemName, itemId: this.itemId, status: status}, function (returnData) {
                if (returnData['success']) {
                    self.itemArray.remove(p);
                    self.message("Operation success");
                } else {
                    self.message(returnData['errorMessage']);
                }
            })
        };

        self.firstCategoryValue.subscribe(function () {
            if (self.firstCategoryValue().childCategories.length == 0) {
                $('#childCategory').attr('class', 'hidden');
            } else {
                $('#childCategory').removeAttr('class');
                if (self.firstCategoryValue().childCategories[0]['categoryName'] != 'All') {
                    self.firstCategoryValue().childCategories.unshift({
                        categoryName: 'All',
                        fatherId: self.firstCategoryValue().firstCategoryId
                    });
                }
            }
            self.currentPage(1);
            self.getFatherCategoryItem(1);
        });
        self.secondCategoryValue.subscribe(function () {
            if (self.secondCategoryValue()) {
                if (self.secondCategoryValue().categoryId) {
                    self.getSecondCategoryItem(1);
                    return;
                }
            }
            self.currentPage(1);
            self.getFatherCategoryItem(1);
        });
        self.showMoreItem = function () {
            self.currentPage(self.currentPage() + 1);
            if (self.secondCategoryValue()) {
                if (self.secondCategoryValue().categoryId) {
                    $.post("/item/get", {
                        categoryId: self.secondCategoryValue().categoryId,
                        page: self.currentPage(),
                        status: self.itemStatus()
                    }, function (itemData) {
                        if (itemData['success']) {
                            if (itemData['itemList'].length == 0) {
                                self.hasPage(false);
                                self.message('');
                                return
                            } else {
                                self.hasPage(true);
                            }
                            for (var i = 0; i < itemData['itemList'].length; i++) {
                                self.itemArray.push(itemData['itemList'][i]);
                            }
                            self.message('');
                        } else {
                            self.message(itemData['errorMessage']);
                            self.itemArray([]);
                        }

                    });
                    return;
                }
            }
            $.post("/item/get", {
                fatherId: self.firstCategoryValue().firstCategoryId,
                page: self.currentPage(),
                status: self.itemStatus()
            }, function (itemData) {
                if (itemData['success']) {
                    if (itemData['itemList'].length == 0) {
                        self.hasPage(false);
                        self.message('');
                        return
                    } else {
                        self.hasPage(true);
                    }
                    for (var i = 0; i < itemData['itemList'].length; i++) {
                        self.itemArray.push(itemData['itemList'][i]);
                    }
                    self.message('');
                } else {
                    self.message(itemData['errorMessage']);
                    self.itemArray([]);
                }
            });
        };
        self.getFatherCategoryItem = function (page) {
            $.post("/item/get", {fatherId: self.firstCategoryValue().firstCategoryId, page: page, status: self.itemStatus()}, function (itemData) {
                if (itemData['success']) {
                    if (itemData['itemList'].length == 0) {
                        self.hasPage(false);
                    } else {
                        self.hasPage(true);
                    }
                    self.itemArray(itemData['itemList']);
                    self.message('');
                } else {
                    self.message(itemData['errorMessage']);
                    self.itemArray([]);
                }
            });
        };
        self.getSecondCategoryItem = function (page) {
            $.post("/item/get", {categoryId: self.secondCategoryValue().categoryId, page: page, status: self.itemStatus()}, function (itemData) {
                if (itemData['success']) {
                    if (itemData['itemList'].length == 0) {
                        self.hasPage(false);
                    } else {
                        self.hasPage(true);
                    }
                    self.itemArray(itemData['itemList']);
                    self.message('');
                } else {
                    self.message(itemData['errorMessage']);
                    self.itemArray([]);
                }

            });
        };


        self.onDelete = function (p) {
            $.post("/item/delete", {itemId: this.itemId, itemName: this.itemName}, function (callBackData) {
                if (!callBackData['success']) {
                    self.message(callBackData['errorMessage']);
                } else {
                    self.message('Operation Success');
                    self.itemArray.remove(p);
                }
            });
        };

        (function () {
            $.get("/category/getAll", function (responseArray) {
                if (responseArray['success']) {
                    var tmpArray = responseArray['categoryArray'];
                    self.categoryArray.push({firstCategoryName: 'All', childCategories: []});
                    for (var i = 0; i < tmpArray.length; i++) {
                        self.categoryArray.push({
                            firstCategoryName: tmpArray[i]['fatherCategory']['categoryName'],
                            firstCategoryId: tmpArray[i]['fatherCategory']['categoryId'],
                            childCategories: tmpArray[i]['childCategories']
                        });
                    }
                } else {
                    self.message(responseArray['errorMessage']);
                }
            })
        })();
    }
    ko.applyBindings(new productPage());
</script>
</body>
</html>