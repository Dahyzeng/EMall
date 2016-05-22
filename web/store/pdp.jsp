<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product view</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%request.getContextPath();%>/store/css/jquery.jqzoom.css" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/html5.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jflow.plus.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="<%request.getContextPath();%>/store/js/checkbox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/radio.js"></script>
    <script src="<%request.getContextPath();%>/store/js/selectBox.js"></script>
    <script src="<%request.getContextPath();%>/store/js/jquery.jqzoom-core.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>
    <script>
        $(document).ready(function() {
            $('#wrapper_tab a').click(function() {
                if ($(this).attr('class') != $('#wrapper_tab').attr('class')) {
                    $('#wrapper_tab').attr('class', $(this).attr('class'));
                }
                return false;
            });
        });
    </script>
    <script>
        $(function() {
            $('#list_product').carouFredSel({
                prev: '#prev_c1',
                next: '#next_c1',
                auto: false
            });
            $('#list_banners').carouFredSel({
                prev: '#ban_prev',
                next: '#ban_next',
                scroll: 1,
                auto: false
            });
            $('#thumblist').carouFredSel({
                prev: '#img_prev',
                next: '#img_next',
                scroll: 1,
                auto: false,
                circular: false,
            });
            $(window).resize();
        });
    </script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main">
    <div class="container_12">
        <!-- .sidebar -->
        <div id="content" class="grid_12">
            <h1 class="page_title">Candles Orange Vanilla</h1>

            <div class="product_page">
                <div class="grid_4 img_slid" id="products">
                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a data-bind="attr: { href: currentShowPicURL }">
                                <img data-bind="attr: { src: currentShowPicURL }" style="width:294px; height:294px" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <ul data-bind="foreach: {data: itemPicArray, as: 'pic'}" class="pagination clearfix">
                        <li>
                            <a href="#" data-bind="click: $root.changeShowPic">
                                <img data-bind="attr: { src: pic.picURL}"/>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="grid_7">
                    <div class="entry_content">
                        <div class="review">
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a href="#"></a>
                            <a href="#"></a>
                            <span>1 REVIEW(S)</span>
                            <a class="add_review" href="#">ADD YOUR REVIEW</a>
                        </div>
                        <p><span data-bind="text: itemDetail().itemName"></span></p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    Availability:
                                    <!-- ko if: itemDetail().inventory !=0 -->
                                    <span>In stock</span>
                                    <!-- /ko -->
                                    <!-- ko if: itemDetail().inventory ==0 -->
                                    <span>Out of stock</span>
                                    <!-- /ko -->
                                </div>
                            </div>
                            <div class="price">
                                <!-- ko ifnot: itemDetail().discount==0 -->
                                <div class="price_new">$<span data-bind="text: itemDetail().price - itemDetail().discount"></span></div>
                                <div class="price_old">$<span data-bind="text: itemDetail().price"></span></div>
                                <!-- /ko -->
                                <!-- ko if: itemDetail().discount==0 -->
                                <div class="price_new">$<span data-bind="text: itemDetail().price"></span></div>
                                <!-- /ko -->
                            </div>
                        </div>
                        <div class="block_cart">
                            <div class="obn_like">
                                <div class="obn"><a href="#" data-bind="click: addCompare" class="obn">Add to Compare</a></div>
                                <div class="like"><a href="#" class="like">Add to Wishlist</a></div>
                            </div>
                            <div class="cart">
                                <a href="#" data-bind="click: addToCart" class="bay">Add to Cart</a>
                                <input style="width:35px;height: 35px;" type="text" class="number" data-bind="value: itemQuantity"/>
                                <span>Quantity:</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="grid_12">
                    <div id="wrapper_tab" class="tab1">
                        <a href="#" class="tab1 tab_link">Description</a>
                        <a href="#" class="tab2 tab_link">Reviews</a>
                        <a href="#" class="tab3 tab_link">Custom Tab</a>

                        <div class="clear"></div>
                        <div class="tab1 tab_body">
                            <h4>Tables Style</h4>

                            <p>Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet. Maecenas
                                tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum adipiscing, eros quis
                                lobortis dictum. Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat
                                volutpat. Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis
                                rhoncus lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate
                                pulvinar adipiscing.</p>
                            <ul>
                                <li>She was walking to the mall.</li>
                                <li>Ted might eat the cake.</li>
                                <li>You must go right now.</li>
                                <li>Words were spoken.</li>
                                <li>The teacher is writing a report.</li>
                            </ul>
                            <p>Here are some verb phrase examples where the verb phrase is the predicate of a sentence.
                                In this case, the verb phrase consists of the main verb plus any auxiliary, or helping,
                                verbs. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta
                                nec, tempus vitae, iaculis semper, pede.</p>
                            <ol>
                                <li>Shipping & Delivery.</li>
                                <li>Privacy & Security.</li>
                                <li>Returns & Replacements.</li>
                                <li>Payment, Pricing & Promotions.</li>
                                <li>Viewing Orders.</li>
                            </ol>
                            <p>Next are some verb phrase examples of verb phrases where the phrase has a single function
                                which means it can act like an adverb or an adjective. The phrase would include the verb
                                and any modifiers, complements, or objects. Lorem ipsum dolor sit amet, consectetuer
                                adipiscing elit. Morbi luctus. Duis lobortis. Lorem ipsum dolor sit amet, consectetur
                                adipiscing elit. Curabitur nec posuere odio. Proin vel ultrices erat. </p>
                            <table>
                                <tr>
                                    <th class="bg">First Column</th>
                                    <th>Second Column</th>
                                    <th class="bg">Third Column</th>
                                    <th>Fourth Column</th>
                                </tr>
                                <tr>
                                    <td class="bg">One</td>
                                    <td>no</td>
                                    <td class="bg">yes</td>
                                    <td>yes, all</td>
                                </tr>
                                <tr>
                                    <td class="bg">Two</td>
                                    <td>0</td>
                                    <td class="bg">1</td>
                                    <td>all</td>
                                </tr>
                                <tr>
                                    <td class="bg">Three</td>
                                    <td>$399</td>
                                    <td class="bg">$599</td>
                                    <td>$799</td>
                                </tr>
                                <tr>
                                    <td class="bg">Four</td>
                                    <td><a href="#">Call action</a></td>
                                    <td class="bg"><a href="#">Call action</a></td>
                                    <td><a href="#">Call action</a></td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                        <!-- .tab1 .tab_body -->
                        <div class="tab2 tab_body">
                            <h4>Customer reviews</h4>
                            <ul class="comments">
                                <li>
                                    <div class="autor">Mike Example</div>
                                    ,
                                    <time datetime="2012-11-03">03.11.2012</time>
                                    <div class="evaluation">
                                        <div class="quality">
                                            <strong>Quality</strong>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a href="#"></a>
                                            <a href="#"></a>
                                        </div>
                                        <div class="price">
                                            <strong>Price</strong>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus_minus" href="#"></a>
                                            <a href="#"></a>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <!-- .evaluation -->
                                    <p>Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet.
                                        Maecenas tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum
                                        adipiscing, eros quis lobortis dictum.</p>
                                </li>
                                <li>
                                    <div class="autor">Mike Example</div>
                                    ,
                                    <time datetime="2012-11-03">03.11.2012</time>
                                    <div class="evaluation">
                                        <div class="quality">
                                            <strong>Quality</strong>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus_minus" href="#"></a>
                                        </div>
                                        <div class="price">
                                            <strong>Price</strong>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a class="plus" href="#"></a>
                                            <a href="#"></a>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <!-- .evaluation -->
                                    <p>Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat volutpat.
                                        Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis rhoncus
                                        lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate
                                        pulvinar adipiscing.</p>
                                </li>
                            </ul>
                            <!-- .comments -->
                            <form class="add_comments">
                                <h4>Write Your Own Review</h4>

                                <div class="evaluation">
                                    <div class="quality">
                                        <strong>Quality</strong><sup class="surely">*</sup>
                                        <input class="niceRadio" type="radio" name="quality" value="1"/><span
                                            class="eva_num">1</span>
                                        <input class="niceRadio" type="radio" name="quality" value="2"/><span
                                            class="eva_num">2</span>
                                        <input class="niceRadio" type="radio" name="quality" value="3"/><span
                                            class="eva_num">3</span>
                                        <input class="niceRadio" type="radio" name="quality" value="4"/><span
                                            class="eva_num">4</span>
                                        <input class="niceRadio" type="radio" name="quality" value="5"/><span
                                            class="eva_num">5</span>
                                    </div>
                                    <div class="price">
                                        <strong>Price</strong><sup class="surely">*</sup>
                                        <input class="niceRadio" type="radio" name="price" value="1"/><span
                                            class="eva_num">1</span>
                                        <input class="niceRadio" type="radio" name="price" value="2"/><span
                                            class="eva_num">2</span>
                                        <input class="niceRadio" type="radio" name="price" value="3"/><span
                                            class="eva_num">3</span>
                                        <input class="niceRadio" type="radio" name="price" value="4"/><span
                                            class="eva_num">4</span>
                                        <input class="niceRadio" type="radio" name="price" value="5"/><span
                                            class="eva_num">5</span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="nickname">
                                    <strong>Nickname</strong><sup class="surely">*</sup>
                                    <br/>
                                    <input type="text" name="" class="" value=""/>
                                </div>
                                <div class="your_review">
                                    <strong>Summary of Your Review</strong><sup class="surely">*</sup>
                                    <br/>
                                    <input type="text" name="" class="" value=""/>
                                </div>
                                <div class="clear"></div>
                                <div class="text_review">
                                    <strong>Review</strong><sup class="surely">*</sup>
                                    <br/>
                                    <textarea name="text"></textarea>
                                    <i>Note: HTML is not translated!</i>
                                </div>
                                <input type="submit" value="Submit Review"/>
                            </form>
                            <div class="clear"></div>
                        </div>
                        <div class="tab3 tab_body">
                            <h4>Custom Tab</h4>

                            <div class="clear"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="clear"></div>
                <div class="related">
                    <div class="c_header">
                        <div class="grid_4">
                            <h2>Related Products</h2>
                        </div>
                        <div class="grid_5">
                            <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                            <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                        </div>
                    </div>
                    <div class="list_carousel">
                        <ul id="list_product" class="list_product">
                            <li class="">
                                <div class="grid_4 product">
                                    <img class="sale" src="images/sale.png" alt="Sale"/>

                                    <div class="prev">
                                        <a href="product_page.html"><img src="images/product_1.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_2.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_3.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_4.png" alt=""
                                                                         title=""/></a>
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
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function pdfPage() {
        var self = this;
        var itemId = '${requestScope.itemId}';
        self.itemDetail = ko.observable({});
        self.currentShowPicURL = ko.observable();
        self.itemPicArray = ko.observableArray();
        self.itemQuantity = ko.observable(1);
        self.changeShowPic = function (p) {
            self.currentShowPicURL(p.picURL);
        };

        self.addToCart = function() {
            $.post("/cart/add", {itemId: itemId, quantity: self.itemQuantity}, function(resultJson) {
                if (resultJson['success']) {
                    alert("add success");
                    getCartItem();
                } else {
                    if (resultJson['errorMessage'] == 'no_login') {
                        if (resultJson['url']) {
                            window.location.href = "/login?url=" + resultJson['url'];
                        } else {
                            window.location.href = "/login";
                        }
                    }
                }
            })
        };

        self.addCompare = function() {
            $.get("/compare/add?itemId=" + itemId, function(result) {
                if (result['success']) {
                    window.location.href = "/compare";
                }
            })
        };
        (function () {
            headerPage();
            $.get('/store/get_item_id/' + itemId, function (itemJson) {
                self.itemDetail(itemJson['item']);
                self.currentShowPicURL(itemJson['item'].showPicURL);
                self.itemPicArray(itemJson['itemPicList']);
                self.itemPicArray.push({picURL: itemJson['item'].showPicURL});
            });
        })();
    }
    ko.applyBindings(new pdfPage());
</script>
</html>

