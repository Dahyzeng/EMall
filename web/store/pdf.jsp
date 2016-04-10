<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Product view</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/html5.js"></script>
    <script src="js/jflow.plus.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/selectBox.js"></script>
    <script src="js/jquery.jqzoom-core.js"></script>
    <script>
        $(document).ready(function () {
            $('.jqzoom').jqzoom({
                zoomType: 'standard',
                lens: true,
                preloadImages: true,
                alwaysOn: false
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#wrapper_tab a').click(function () {
                if ($(this).attr('class') != $('#wrapper_tab').attr('class')) {
                    $('#wrapper_tab').attr('class', $(this).attr('class'));
                }
                return false;
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
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $(this).addClass('click')
            });
        })
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
                    <img class="sale" src="images/sale.png" alt="Sale"/>

                    <div class="preview slides_container">
                        <div class="prev_bg">
                            <a href="images/produkt_slid.png" class="jqzoom" rel='gal1' title="">
                                <img src="images/produkt_slid.png" title="" alt=""/>
                            </a>
                        </div>
                    </div>
                    <!-- .prev -->
                    <ul class="pagination clearfix" id="thumblist">
                        <li>
                            <a class="zoomThumbActive" href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: './images/produkt_slid.png',largeimage: './images/produkt_slid.png'}"><img
                                    src='images/produkt_slid.png' alt=""></a>
                        </li>
                        <li>
                            <a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: './images/produkt_slid1.png',largeimage: './images/produkt_slid1.png'}"><img
                                    src='images/produkt_slid1.png' alt=""></a>
                        </li>
                        <li>
                            <a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: './images/produkt_slid2.png',largeimage: './images/produkt_slid2.png'}"><img
                                    src='images/produkt_slid2.png' alt=""></a>
                        </li>
                        <li>
                            <a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: './images/produkt_slid3.png',largeimage: './images/produkt_slid3.png'}"><img
                                    src='images/produkt_slid3.png' alt=""></a>
                        </li>
                        <li>
                            <a href='javascript:void(0);'
                               rel="{gallery: 'gal1', smallimage: './images/produkt_slid4.png',largeimage: './images/produkt_slid4.png'}"><img
                                    src='images/produkt_slid4.png' alt=""></a>
                        </li>
                    </ul>
                    <div class="next_prev">
                        <a id="img_prev" class="arows" href="#"><span>Prev</span></a>
                        <a id="img_next" class="arows" href="#"><span>Next</span></a>
                    </div>
                    <!-- . -->
                </div>
                <!-- .grid_4 -->
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
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus congue.
                            Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra lectus
                            fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>

                        <div class="ava_price">
                            <div class="availability_sku">
                                <div class="availability">
                                    Availability: <span>In stock</span>
                                </div>
                                <div class="sku">
                                    SKU: <span>Candles OV</span>
                                </div>
                            </div>
                            <!-- .availability_sku -->
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <!-- .price -->
                        </div>
                        <!-- .ava_price -->
                        <div class="block_cart">
                            <div class="obn_like">
                                <div class="obn"><a href="#" class="obn">Add to Compare</a></div>
                                <div class="like"><a href="#" class="like">Add to Wishlist</a></div>
                            </div>
                            <div class="cart">
                                <a href="#" class="bay">Add to Cart</a>
                                <input type="text" name="" class="number" value="1"/>
                                <span>Quantity:</span>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <!-- .block_cart -->
                        <div class="soc">
                            <img src="images/soc.png" alt="Soc"/>
                        </div>
                        <!-- .soc -->
                    </div>
                    <!-- .entry_content -->
                </div>
                <!-- .grid_5 -->
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
                                <!-- .evaluation -->
                                <div class="nickname">
                                    <strong>Nickname</strong><sup class="surely">*</sup>
                                    <br/>
                                    <input type="text" name="" class="" value=""/>
                                </div>
                                <!-- .nickname -->
                                <div class="your_review">
                                    <strong>Summary of Your Review</strong><sup class="surely">*</sup>
                                    <br/>
                                    <input type="text" name="" class="" value=""/>
                                </div>
                                <!-- .your_review -->
                                <div class="clear"></div>
                                <div class="text_review">
                                    <strong>Review</strong><sup class="surely">*</sup>
                                    <br/>
                                    <textarea name="text"></textarea>
                                    <i>Note: HTML is not translated!</i>
                                </div>
                                <!-- .text_review -->
                                <input type="submit" value="Submit Review"/>
                            </form>
                            <!-- .add_comments -->
                            <div class="clear"></div>
                        </div>
                        <!-- .tab2 .tab_body -->
                        <div class="tab3 tab_body">
                            <h4>Custom Tab</h4>

                            <div class="clear"></div>
                        </div>
                        <!-- .tab3 .tab_body -->
                        <div class="clear"></div>
                    </div>
                    ​
                    <!-- #wrapper_tab -->
                    <div class="clear"></div>
                </div>
                <!-- .grid_9 -->
                <div class="clear"></div>
                <div class="related">
                    <div class="c_header">
                        <div class="grid_4">
                            <h2>Related Products</h2>
                        </div>
                        <!-- .grid_7 -->
                        <div class="grid_5">
                            <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                            <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                        </div>
                        <!-- .grid_2 -->
                    </div>
                    <!-- .c_header -->
                    <div class="list_carousel">
                        <ul id="list_product" class="list_product">
                            <li class="">
                                <div class="grid_4 product">
                                    <img class="sale" src="images/sale.png" alt="Sale"/>

                                    <div class="prev">
                                        <a href="product_page.html"><img src="images/product_1.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_2.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_3.png" alt=""
                                                                         title=""/></a>
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
                                        <a href="product_page.html"><img src="images/product_4.png" alt=""
                                                                         title=""/></a>
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
            </div>
            <!-- .product_page -->
            <div class="clear"></div>
        </div>
        <!-- #content -->
        <div class="clear"></div>
    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>

</html>

