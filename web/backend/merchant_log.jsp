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
                    <button class="btn btn-success" data-bind="click: searchLog">Search</button>
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
</div>
</body>
<script>
    function logPage() {
        var self = this;
        self.page = ko.observable(1);
        self.logArray = ko.observableArray();
        self.searchName = ko.observable();

        self.searchLog = function () {
            $.get("/log/get?name=" + self.searchName() + "&page=" + self.page(), function(json) {
                if (json['success']) {
                    self.logArray(json['logArray']);
                }
            })
        };
        (function () {
            $.get("/log/get?page=1", function(json) {
               if (json['success']) {
                   self.logArray(json['logArray']);
               }
            });
        })();
    }
    ko.applyBindings(new logPage());
</script>
</html>