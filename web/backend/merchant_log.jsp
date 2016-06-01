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
    <!-- open sans font -->
</head>
<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>

<div class="content">
    <div class="contentHeader">
        <h1 class="page-title">Log</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="/merchant/home" style="color: #0088cc">Home</a> <span class="divider">/</span></li>
        <li class="active">Log</li>
    </ul>

    <div class="container-fluid">
        <div style="margin-left: 30px">
            <div class="table-wrapper products-table section">
                <div>
                    <input type="text" style="height: 30px" data-bind="value: searchName" placeholder="search account name" >
                    <button class="btn btn-success" style="margin-top: -10px" data-bind="click: searchLog">Search</button>
                </div>
                <div class="row-fluid">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span3">
                                <span class="line"></span>Name
                            </th>
                            <th class="span3">
                                <span class="line"></span>Date
                            </th>
                            <th class="span6">
                                <span class="line"></span>Operation
                            </th>
                        </tr>
                        </thead>
                        <tbody data-bind="foreach: {data: logArray, as: 'log'}">
                        <tr class="first">
                            <td>
                                <span data-bind="text: log.merchantName"></span>
                            </td>
                            <td>
                                <span data-bind="text: log.date"></span>
                            </td>
                            <td class="description">
                                <span data-bind="text: log.operation"></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- ko if: logArray().length != 0-->
    <div class="wizard-actions" style="text-align: center">
        <button type="button" class="btn btn-success btn-mini" data-bind="click: prevPage">
            <i class="icon-chevron-left"></i> Prev
        </button>
        <span style="font-size: 16px" data-bind="text: currentPage() + '/' + totalPage()"></span>
        <button type="button" class="btn btn-success btn-mini" data-last="Finish" data-bind="click: nextPage">
            Next <i class="icon-chevron-right"></i>
        </button>
    </div>
    <!-- /ko -->
</div>
</body>
<script>
    function logPage() {
        var self = this;
        self.currentPage = ko.observable(1);
        self.logArray = ko.observableArray();
        self.searchName = ko.observable();
        self.logCount = ko.observable();
        self.totalPage = ko.observable();

        self.searchLog = function (c) {
            if (c != 'continue') {
                self.currentPage(1);
            }
            $.get("/log/get?name=" + self.searchName() + "&page=" + self.currentPage(), function(json) {
                if (json['success']) {
                    self.logArray(json['logArray']);
                }
            })
        };
        self.prevPage = function () {
            if (self.currentPage() == 1) {
                return
            }
            self.currentPage(self.currentPage() - 1);
            if (self.searchName()) {
                self.searchLog('continue');
            } else {
                self.getAllLog();
            }
        };
        self.nextPage = function () {
            if (self.currentPage() == self.totalPage()) {
                return
            }
            self.currentPage(self.currentPage() + 1);
            if (self.searchName()) {
                self.searchLog('continue');
            } else {
                self.getAllLog();
            }
        };

        self.getAllLog = function () {
            $.get("/log/get?page=" + self.currentPage(), function(json) {
                if (json['success']) {
                    self.logArray(json['logArray']);
                    self.logCount(json['logCount']);
                    self.totalPage(json['totalPage']);
                }
            });
        };

        (function () {
            self.getAllLog();
        })();
    }
    ko.applyBindings(new logPage());
</script>
</html>