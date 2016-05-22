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
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/chart.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/morris.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/jquery.flot.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/jquery.flot.resize.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/jquery.flot.stack.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>
<div class="content">
    <div id="main-stats">
        <div class="row-fluid stats-row">
            <div class="span3 stat">
                <div class="data">
                    <span class="number" data-bind="text: statistic().users"></span>
                    Users
                </div>
            </div>
            <div class="span3 stat">
                <div class="data">
                    <span class="number" data-bind="text: statistic().totalFinishedOrder"></span>
                    finished order
                </div>
            </div>
            <div class="span3 stat">
                <div class="data">
                    <span class="number" data-bind="text: statistic().items"></span>
                    total items
                </div>
            </div>
            <div class="span3 stat last">
                <div class="data">
                    <span class="number" data-bind="text: '$' + statistic().sales"></span>
                    sales
                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid" style="margin-top: 20px">
        <h4 class="title">
            Week Orders
            <%--<div class="btn-group pull-right">--%>
                <%--<button class="glow left">DAY</button>--%>
                <%--<button class="glow middle active">MONTH</button>--%>
                <%--<button class="glow right">YEAR</button>--%>
            <%--</div>--%>
        </h4>
        <div class="span12">
            <div id="statsChart"></div>
        </div>
    </div>

    <div class="row-fluid" style="margin-top: 20px">
        <h4 class="title">
            TOP TEN
        </h4>
        <div class="span12 chart">
            <div id="hero-bar" style="height: 250px;"></div>
        </div>
    </div>

</div>

</body>
<script>
//    var visits = [[1, 5], [2, 4], [3, 4], [4, 2],[5, 5],[6, 6],[7, 6],[8, 7],[9, 6],[10, 7],[11, 5],[12, 5]];


    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y - 30,
            left: x - 50,
            color: "#fff",
            padding: '2px 5px',
            'border-radius': '6px',
            'background-color': '#000',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#statsChart").bind("plothover", function (event, pos, item) {
        if (item) {
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;

                $("#tooltip").remove();
                var x = item.datapoint[0].toFixed(0),
                        y = item.datapoint[1].toFixed(0);

                var month = item.series.xaxis.ticks[item.dataIndex].label;

                showTooltip(item.pageX, item.pageY,
                        item.series.label + " of " + month + ": " + y);
            }
        }
        else {
            $("#tooltip").remove();
            previousPoint = null;
        }
    });
</script>
<script>
    function initData(orderCount, itemSaleQuantity) {
        var saleCount = [];
        var ticks = [];
        for (var i = 1; i <= orderCount.length; i++) {
            var unit = [];
            var tick = [];
            unit.push(i);
            tick.push(i);
            for (var key in orderCount[i - 1]) {
                unit.push(orderCount[i - 1][key]);
                tick.push(key);
            }
            saleCount.push(unit);
            ticks.push(tick);
        }
        var plot = $.plot($("#statsChart"),
                [ { data: saleCount, label: "Week"}], {
                    series: {
                        lines: { show: true,
                            lineWidth: 1,
                            fill: true,
                            fillColor: { colors: [ { opacity: 0.05 }, { opacity: 0.09 } ] }
                        },
                        points: { show: true,
                            lineWidth: 2,
                            radius: 3
                        },
                        shadowSize: 0,
                        stack: true
                    },
                    grid: { hoverable: true,
                        clickable: true,
                        tickColor: "#f9f9f9",
                        borderWidth: 0
                    },
                    legend: {
                        // show: false
                        labelBoxBorderColor: "#fff"
                    },
                    colors: ["#30a0eb"],
                    xaxis: {
                        ticks: ticks,
                        font: {
                            size: 12,
                            family: "Open Sans, Arial",
                            variant: "small-caps",
                            color: "#9da3a9"
                        }
                    },
                    yaxis: {
                        ticks:3,
                        tickDecimals: 0,
                        font: {size:12, color: "#9da3a9"}
                    }
                });
        Morris.Bar({
            element: 'hero-bar',
            data: itemSaleQuantity,
            xkey: 'name',
            ykeys: ['sells'],
            labels: ['Sells'],
            barRatio: 0.4,
            xLabelMargin: 20,
            hideHover: 'auto',
            barColors: ["#3d88ba"]
        });
    }
    function homePage() {
        var self = this;
        self.statistic = ko.observable({});
        self.orderCount = ko.observableArray();
        self.itemSaleQuantity = ko.observableArray();
        (function () {
            $.get("/statistic/total", function (json) {
                if (json['success']) {
                    self.statistic(json['statistic']);
                    self.orderCount(json['orderCount']);
                    self.itemSaleQuantity(json['itemSaleQuantityArray']);
                    initData(self.orderCount(), self.itemSaleQuantity());
                }
            });
        })();
    }
    ko.applyBindings(new homePage());
</script>
</html>
