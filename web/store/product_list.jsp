<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">

    <link rel="shortcut icon" href="images/favicon.html">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <title>Catalog (list type view)</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/html5.js"></script>
    <script src="js/jflow.plus.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/selectBox.js"></script>

    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>

    <script>
        $(document).ready(function () {
            $("#myController").jFlow({
                controller: ".control", // must be class, use . sign
                slideWrapper: "#jFlowSlider", // must be id, use # sign
                slides: "#slider",  // the div where all your sliding divs are nested in
                selectedWrapper: "jFlowSelected",  // just pure text, no sign
                width: "984px",  // this is the width for the content-slider
                height: "480px",  // this is the height for the content-slider
                duration: 400,  // time in miliseconds to transition one slide
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
<jsp:include page="common/header.jsp"/>

<div class="container_12">
    <div class="grid_12">
        <div class="breadcrumbs">
            <a href="index.html">Home</a><span>&#8250;</span><a href="#">Category</a><span>&#8250;</span><span
                class="current">This page</span>
        </div>
        <!-- .breadcrumbs -->
    </div>
    <!-- .grid_12 -->
</div>

<section id="main">
    <div class="container_12">
        <div id="sidebar" class="grid_3">
            <aside id="categories_nav">
                <h3>Categories</h3>

                <nav class="left_menu">
                    <ul>
                        <li><a href="#">Solids <span>(21)</span></a></li>
                        <li><a href="#">Liquids <span> (27)</span></a></li>
                        <li><a href="#">Spray <span>(33)</span></a></li>
                        <li><a href="#">Electric <span>(17)</span></a></li>
                        <li><a href="#">For Cars <span>(23)</span></a></li>
                        <li><a href="#">For Room <span>(7)</span></a></li>
                        <li class="last"><a href="#">Other <span>(135)</span></a></li>
                    </ul>
                </nav>
                <!-- .left_menu -->
            </aside>
            <!-- #categories_nav -->

            <aside id="shop_by">
                <h3>Shop By</h3>

                <div class="currently_shopping">
                    <p>Currently Shopping by:</p>
                    <ul>
                        <li><a title="close" class="close" href="#"></a>Price: <span>$0.00 - $999.99</span></li>
                        <li><a title="close" class="close" href="#"></a>Manufacturer: <span>Apple</span></li>
                    </ul>

                    <a class="clear_all" href="#">Clear All</a>

                    <div class="clear"></div>
                </div>
                <!-- .currently_shopping -->

                <h4>Category</h4>

                <form action="#" class="check_opt">
                    <p><input class="niceCheck" type="checkbox">For Home (23)</p>

                    <p><input class="niceCheck" type="checkbox" name="" value="">For Car (27)</p>

                    <p><input class="niceCheck" type="checkbox" name="" value="">For Office (9)</p>
                </form>

                <h4>Price</h4>

                <form action="#" class="check_opt">
                    <p><input class="niceCheck" type="checkbox" name="" value="">0.00 - $49.99 (21)</p>

                    <p><input class="niceCheck" type="checkbox" name="" value="">$50.00 - $99.99 (7)</p>

                    <p><input class="niceCheck" type="checkbox" name="" value="">0$100.00 and above (15)</p>
                </form>
            </aside>
            <!-- #shop_by -->

            <aside id="specials" class="specials">
                <h3>Specials</h3>

                <ul>
                    <li>
                        <div class="prev">
                            <a href="product_page.html"><img src="images/special1.png" alt="" title=""/></a>
                        </div>

                        <div class="cont">
                            <a href="product_page.html">Honeysuckle Flameless Luminary Refill</a>

                            <div class="prise"><span class="old">$177.00</span>$75.00</div>
                        </div>
                    </li>

                    <li>
                        <div class="prev">
                            <a href="product_page.html"><img src="images/special2.png" alt="" title=""/></a>
                        </div>

                        <div class="cont">
                            <a href="product_page.html">Honeysuckle Flameless Luminary Refill</a>

                            <div class="prise"><span class="old">$177.00</span>$75.00</div>
                        </div>
                    </li>
                </ul>
            </aside>
            <!-- #specials -->

            <aside id="newsletter_signup">
                <h3>Newsletter Signup</h3>

                <p>Phasellus vel ultricies felis. Duis
                    rhoncus risus eu urna pretium.</p>

                <form class="newsletter">
                    <input type="email" name="newsletter" class="your_email" value=""
                           placeholder="Enter your email address..."/>
                    <input type="submit" id="submit" value="Subscribe"/>
                </form>
            </aside>
            <!-- #newsletter_signup -->
        </div>
        <!-- .sidebar -->

        <div id="content" class="grid_9">
            <h1 class="page_title">Product List</h1>

            <div class="options">
                <div class="grid-list">
                    <a class="grid" href="catalog_grid.html"><span>img</span></a>
                    <a class="list curent" href="index.html"><span>img</span></a>
                </div>
                <!-- .grid-list -->

                <div class="show">
                    Show
                    <select>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>

                    per page
                </div>
                <!-- .show -->

                <div class="sort">
                    Sort By
                    <select>
                        <option>Position</option>
                        <option>Price</option>
                        <option>Rating</option>
                        <option>Name</option>
                    </select>

                    <a class="sort_up" href="#">&#8593;</a>
                </div>
                <!-- .sort -->
            </div>
            <!-- .options -->

            <div class="listing_product">
                <div class="product_li">
                    <div class="grid_3">
                        <img class="sale" src="images/new.png" alt="New"/>

                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_1.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">
                    <div class="grid_3">
                        <img class="sale" src="images/sale.png" alt="Sale"/>

                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_2.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">
                    <div class="grid_3">
                        <img class="sale" src="images/top.png" alt="Top"/>

                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_3.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">
                    <div class="grid_3">
                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_4.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">
                    <div class="grid_3">
                        <img class="sale" src="images/new.png" alt="New"/>

                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_5.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="product_li">
                    <div class="grid_3">
                        <div class="prev">
                            <a href="product_page.html"><img src="images/product_6.png" alt="" title=""/></a>
                        </div>
                        <!-- .prev -->
                    </div>
                    <!-- .grid_3 -->

                    <div class="grid_4">
                        <div class="entry_content">
                            <a href="product_page.html"><h3 class="title">Beanpod Candles Orange Vanilla, Tea Light</h3>
                            </a>

                            <div class="review">
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a class="plus" href="#"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                                <span>1 REVIEW(S)</span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus
                                congue. Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra
                                lectus fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p>
                            <a class="more" href="product_page.html">Learn More</a>
                        </div>
                        <!-- .entry_content -->
                    </div>
                    <!-- .grid_4 -->

                    <div class="grid_2">
                        <div class="cart">
                            <div class="price">
                                <div class="price_new">$550.00</div>
                                <div class="price_old">$725.00</div>
                            </div>
                            <a href="#" class="bay">Add to Cart</a>
                            <a href="#" class="obn"></a>
                            <a href="#" class="like"></a>
                        </div>
                        <!-- .cart -->
                    </div>
                    <!-- .grid_2 -->

                    <div class="clear"></div>
                </div>
                <!-- .article -->

                <div class="clear"></div>
            </div>
            <!-- .listing_product -->

            <div class="clear"></div>

            <div class="pagination">
                <ul>
                    <li class="prev"><span>&#8592;</span></li>
                    <li class="curent"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><span>...</span></li>
                    <li><a href="#">100</a></li>
                    <li class="next"><a href="#">&#8594;</a></li>
                </ul>
            </div>
            <!-- .pagination -->
            <p class="pagination_info">Displaying 1 to 12 (of 100 products)</p>
        </div>
        <!-- #content -->

        <div class="clear"></div>

    </div>
    <!-- .container_12 -->
</section>


<jsp:include page="common/footer.jsp"/>
</body>
</html>