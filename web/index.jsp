<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="<%request.getContextPath();%>/store/css/bootstrap/bootstrap.combined.css" media="screen" rel="stylesheet" type="text/css"/>
    <link href="store/css/style.css" media="screen" rel="stylesheet" type="text/css"/>
    <link href="store/css/grid.css" media="screen" rel="stylesheet" type="text/css"/>
    <script src="store/js/jquery-2.1.1.min.js"></script>
    <script src="store/js/html5.js"></script>
    <script src="store/js/jflow.plus.js"></script>
    <script src="store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
    <script src="<%request.getContextPath();%>/store/js/carousel.js"></script>

</head>
<body>
<jsp:include page="store/common/header.jsp"/>
<div class="container_12">
    <div id="picplayer" style="position:relative;overflow:hidden;width:984px;height:478px;clear:none;border:solid 1px #ccc;margin-left: 10px;">
    </div>
</div>
<section id="main" class="home">
    <div class="container_12">
        <div class="carousel">
            <div class="c_header">
                <div class="grid_10">
                    <h2>Best Sellers</h2>
                </div>
                <div class="grid_2">
                    <a id="next_c1" class="next arows" href="#" data-bind="click: changeNext"><span>Next</span></a>
                    <a id="prev_c1" class="prev arows" href="#" data-bind="click: changeNext"><span>Prev</span></a>
                </div>
            </div>
            <div class="list_carousel">
                <ul id="list_product" class="list_product" data-bind="foreach: {data: currentBestSale, as: 'item'}">
                    <li style="float: left;width: 245px">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a data-bind="attr:{href: '/pdp/' + item.itemId}">
                                    <img data-bind="attr: {src: item.showPicURL}" />
                                </a>
                            </div>
                            <h3 class="title" data-bind="text: item.itemName"></h3>
                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <!-- ko ifnot: item.discount==0 -->
                                        <div class="price_new">$<span data-bind="text: item.price - item.discount"></span></div>
                                        <div class="price_old">$<span data-bind="text: item.price"></span></div>
                                        <!-- /ko -->
                                        <!-- ko if: item.discount==0 -->
                                        <div class="price_new">$<span data-bind="text: item.price"></span></div>
                                        <!-- /ko -->
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="store/common/footer.jsp"/>
</body>
<script>
    function initData(carouselArray) {
        var p = $('#picplayer');
        var pics = [];
        for (var i = 0; i < carouselArray.length; i++) {
            var pic = {};
            pic['url'] = carouselArray[i]['picURL'];
            pic['link'] = '/pdp/' + carouselArray[i]['itemId'];
            pic['time'] = 5000;
            pics.push(pic);
        }
        initPicPlayer(pics,p.css('width').split('px')[0],p.css('height').split('px')[0]);

    }
    function indexPage() {
        var self = this;
        self.carouselArray = ko.observableArray();

        self.currentBestSale = ko.observableArray();
        self.bestSale = ko.observableArray();
        self.currentBestSalePage = ko.observable(1);
        self.changeNext = function () {
            if (self.bestSale().length == 4) {
                return;
            }
            self.currentBestSalePage(self.currentBestSalePage() + 1);
            if ((self.currentBestSalePage() - 1) * 4 > self.bestSale().length) {
                self.currentBestSalePage(1);
                self.currentBestSale(self.bestSale().slice(0, 4));

            } else {
                if (self.currentBestSalePage() * 4 > self.bestSale().length) {
                    self.currentBestSale(self.bestSale.slice((self.currentBestSalePage() - 1) * 4, self.bestSale().length));
                } else
                self.currentBestSale(self.bestSale.slice((self.currentBestSalePage() - 1) * 4, self.currentBestSalePage() * 4));
            }
        };

        (function () {
            headerPage();
            $.get("/store/get_carousel", function(carouselJson) {
                self.carouselArray(carouselJson);
                initData(self.carouselArray());
            });
            $.get("/store/top", function (array) {
                self.bestSale(array);
                self.currentBestSale(self.bestSale().slice(0, 4));
            })
        })();
    }
    ko.applyBindings(new indexPage());
</script>
</html>
