<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Home</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="store/css/style.css" media="screen" rel="stylesheet" type="text/css"/>
    <link href="store/css/grid.css" media="screen" rel="stylesheet" type="text/css"/>
    <script src="store/js/jquery-2.1.1.min.js"></script>
    <script src="store/js/html5.js"></script>
    <script src="store/js/jflow.plus.js"></script>
    <script src="store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
    <script>
        $(document).ready(function () {
            $("#myController").jFlow({
                controller: ".control", // must be class, use . sign
                slideWrapper: "#jFlowSlider", // must be id, use # sign
                slides: "#slider", // the div where all your sliding divs are nested in
                selectedWrapper: "jFlowSelected", // just pure text, no sign
                width: "984px", // this is the width for the content-slider
                height: "480px", // this is the height for the content-slider
                duration: 10, // time in miliseconds to transition one slide
                prev: ".slidprev", // must be class, use . sign
                next: ".slidnext", // must be class, use . sign
                auto: true
            });
        });
    </script>
    <script>
        $(function () {
            $('#list_product').carouFredSel({
                prev: '#prev_c1',
                next: '#next_c1',
                auto: false
            });
            $('#list_product2').carouFredSel({
                prev: '#prev_c2',
                next: '#next_c2',
                auto: false
            });
            $(window).resize();
        });
    </script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $(this).addClass('click')
            });
        })
    </script>
</head>

<body>
<jsp:include page="store/common/header.jsp"/>
<div class="container_12">
    <div class="grid_12">
        <div class="slidprev"><span>Prev</span></div>
        <div class="slidnext"><span>Next</span></div>
        <div id="slider" data-bind="foreach: { data: carouselArray, as: 'carousel'}">
            <div>
                <img style="width: 984px; height: 480px;" data-bind="attr: {src: carousel.picURL}" alt=""/>

                <%--<div class="slid_text">--%>
                    <%--<h3 class="slid_title"><span>Breeze Theme</span></h3>--%>

                    <%--<p><span>Breeze is the 14 stylish HTML templates,</span></p>--%>

                    <%--<p><span>which will helps you boost sales</span></p>--%>

                    <%--<p><span>and receive good feedback from your clients.</span></p>--%>
                <%--</div>--%>
            </div>
        </div>

        <div id="myController">
            <div class="control"></div>
            <div class="control"></div>
        </div>
    </div>
</div>

<section id="main" class="home">
    <div class="container_12">
        <div id="top_button">
            <div class="grid_4">
                <a href="#" class="button_block best_price">
                    <img src="store/images/banner1.png" alt="Banner 1"/>
                </a>
                <!-- .best_price -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <a href="#" class="button_block new_smells">
                    <img src="store/images/banner2.png" alt="Banner 2"/>
                </a>
                <!-- .new smells -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <a href="#" class="button_block only_natural">
                    <img src="store/images/banner3.png" alt="Banner 3"/>
                </a>
                <!-- .only_natural -->
            </div>
            <!-- .grid_4 -->
            <div class="clear"></div>
        </div>
        <!-- #top_button -->
        <div class="clear"></div>
        <div class="carousel">
            <div class="c_header">
                <div class="grid_10">
                    <h2>Best Sellers</h2>
                </div>
                <!-- .grid_10 -->
                <div class="grid_2">
                    <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                    <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                </div>
                <!-- .grid_2 -->
            </div>
            <!-- .c_header -->
            <div class="list_carousel">
                <ul id="list_product" class="list_product">
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_1.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_2.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_3.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_4.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_8.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                </ul>
                <!-- #list_product -->
            </div>
            <!-- .list_carousel -->
        </div>
        <!-- .carousel -->
        <div class="carousel">
            <div class="c_header">
                <div class="grid_10">
                    <h2>Featured Products</h2>
                </div>
                <!-- .grid_10 -->
                <div class="grid_2">
                    <a id="next_c2" class="next arows" href="#"><span>Next</span></a>
                    <a id="prev_c2" class="prev arows" href="#"><span>Prev</span></a>
                </div>
                <!-- .grid_2 -->
            </div>
            <!-- .c_header -->
            <div class="list_carousel">
                <ul id="list_product2" class="list_product">
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_5.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                            <!-- .cart -->
                        </div>
                        <!-- .grid_3 -->
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_6.png" alt="" title=""/></a>
                            </div>
                            <!-- .prev -->
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_7.png" alt="" title=""/></a>
                            </div>
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <img class="sale" src="store/images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/produkt_slid1.png" alt="" title=""/></a>
                            </div>
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
                                    </div>
                                </div>
                                <a href="#" class="obn"></a>
                                <a href="#" class="like"></a>
                                <a href="#" class="bay"></a>
                            </div>
                        </div>
                    </li>
                    <li class="">
                        <div class="grid_3 product">
                            <div class="prev">
                                <a href="product_page.html"><img src="store/images/product_9.png" alt="" title=""/></a>
                            </div>
                            <h3 class="title">Febreze Air Effects New Zealand Springs</h3>

                            <div class="cart">
                                <div class="price">
                                    <div class="vert">
                                        <div class="price_new">$550.00</div>
                                        <div class="price_old">$725.00</div>
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

        <div id="content_bottom">
            <div class="grid_4">
                <div class="bottom_block about_as">
                    <h3>About Us</h3>

                    <p>A block of text is a stack of line boxes. In the case of 'left', 'right' and 'center', this
                        property specifies how the inline-level boxes within each line box align with respect to the
                        line box's </p>

                    <p>Alignment is not with respect to the viewport. In the case of 'justify', this property specifies
                        that the inline-level boxes are to be made flush with both sides of the line box if
                        possible.</p>

                    <p>by expanding or contracting the contents of inline boxes, else aligned as for the initial
                        value.</p>
                </div>
                <!-- .about_as -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <div class="bottom_block news">
                    <h3>News</h3>
                    <ul>
                        <li>
                            <time datetime="2012-03-03">3 january 2012</time>
                            <a href="#">A block of text is a stack of line boxes. In the case of 'left', 'right' and
                                'center', this property specifies</a>
                        </li>
                        <li>
                            <time datetime="2012-02-03">2 january 2012</time>
                            <a href="#">A block of text is a stack of line boxes. In the case of 'left', 'right' and
                                'center', this property specifies</a>
                        </li>
                        <li>
                            <time datetime="2012-01-03">1 january 2012</time>
                            <a href="#">A block of text is a stack of line boxes. In the case of 'left', 'right' and
                                'center', this property specifies how the inline-level boxes within each line</a>
                        </li>
                    </ul>
                </div>
                <!-- .news -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <div class="bottom_block newsletter">
                    <h3>Newsletter</h3>

                    <p>Cursus in dapibus ultrices velit fusce. Felis lacus erat. Fermentum parturient lacus tristique
                        habitant nullam morbi et odio nibh mus dictum tellus erat.</p>

                    <form class="letter_form">
                        <input type="email" name="newsletter" class="l_form" value=""
                               placeholder="Enter your email address..."/>
                        <input type="submit" id="submit" value=""/>
                    </form>
                    <div class="lettel_description">
                        Vel lobortis gravida. Cursus in dapibus ultrices velit fusce. Felis lacus erat.
                    </div>
                    <!-- .lettel_description -->
                </div>
                <!-- .newsletter -->
            </div>
            <!-- .grid_4 -->
            <div class="clear"></div>
        </div>

        <div class="clear"></div>
    </div>

</section>
<jsp:include page="store/common/footer.jsp"/>
</body>
<script>
    function indexPage() {
        var self = this;
        self.carouselArray = ko.observableArray();
        (function () {
            headerPage();
            $.get("/store/get_carousel", function(carouselJson) {
                self.carouselArray(carouselJson);
            })
        })();
    }
    ko.applyBindings(new indexPage());
</script>
</html>
