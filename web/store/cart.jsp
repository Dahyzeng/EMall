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
    <title>Shoping cart</title>
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

</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div class="grid_12">
            <h1 class="page_title">Shopping Cart</h1>
            <table class="cart_product">
                <tr>
                    <th class="images"></th>
                    <th class="bg name">Product Name</th>
                    <th class="edit"></th>
                    <th class="bg price">Unit Price</th>
                    <th class="qty">Qty</th>
                    <th class="bg subtotal">Subtotal</th>
                    <th class="close"></th>
                </tr>
                <tr>
                    <td class="images">
                        <a href="product_page.html"><img src="images/product_6.png" alt="Product 6"></a>
                    </td>
                    <td class="bg name">Paddywax Fragrance Diffuser Set, Gardenia Tuberose,
                        <br/> Jasmine, 4-Ounces
                    </td>
                    <td class="edit"><a title="Edit" href="#">Edit</a></td>
                    <td class="bg price">$75.00</td>
                    <td class="qty">
                        <input type="text" name="" value="" placeholder="1000"/>
                    </td>
                    <td class="bg subtotal">$750.00</td>
                    <td class="close">
                        <a title="close" class="close" href="#"></a>
                    </td>
                </tr>
                <tr>
                    <td class="images">
                        <a href="product_page.html"><img src="images/produkt_slid1.png" alt="Product Slide 1"></a>
                    </td>
                    <td class="bg name">California Scents Spillproof Organic Air Fresheners,
                        <br/> Coronado Cherry, 1.5 Ounce Cannister
                    </td>
                    <td class="edit"><a title="Edit" href="#">Edit</a></td>
                    <td class="bg price">$75.00</td>
                    <td class="qty">
                        <input type="text" name="" value="" placeholder="1000"/>
                    </td>
                    <td class="bg subtotal">$750.00</td>
                    <td class="close">
                        <a title="close" class="close" href="#"></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="cart_but">
                        <button class="continue"><span>icon</span>Continue Shopping</button>
                        <button class="update"><span>icon</span>Update Shopping Cart</button>
                    </td>
                </tr>
            </table>
        </div>
        <!-- .grid_12 -->
        <div id="content_bottom">
            <div class="grid_4">
                <div class="bottom_block estimate">
                    <h3>Estimate Shipping and Tax</h3>

                    <p>Enter your destination to get a shipping estimate.</p>

                    <form>
                        <p>
                            <strong>Country:</strong><sup class="surely">*</sup>
                            <br/>
                            <select>
                                <option>United States</option>
                                <option>United States</option>
                            </select>
                        </p>
                        <p>
                            <strong>State/Province:</strong>
                            <br/>
                            <select>
                                <option>Please select region, state or province</option>
                                <option>Please select region, state or province</option>
                            </select>
                        </p>
                        <p>
                            <strong>Zip/Postal Code</strong>
                            <br/>
                            <input type="text" name="" value=""/>
                        </p>
                        <input type="submit" id="get_estimate" value="Get a Quote"/>
                    </form>
                </div>
                <!-- .estimate -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <div class="bottom_block discount">
                    <h3>Discount Codes</h3>

                    <p>Enter your coupon code if you have one.</p>

                    <form>
                        <p>
                            <input type="text" name="" value="" placeholder="United States"/>
                        </p>
                        <input type="submit" id="apply_coupon" value="Apply Coupon"/>
                    </form>
                </div>
                <!-- .discount -->
            </div>
            <!-- .grid_4 -->
            <div class="grid_4">
                <div class="bottom_block total">
                    <table class="subtotal">
                        <tr>
                            <td>Subtotal</td>
                            <td class="price">$1, 500.00</td>
                        </tr>
                        <tr class="grand_total">
                            <td>Grand Total</td>
                            <td class="price">$1, 500.00</td>
                        </tr>
                    </table>
                    <button class="checkout">PROCEED TO CHECKOUT</button>
                    <a href="#">Checkout with Multiple Addresses</a>
                </div>
                <!-- .total -->
            </div>
            <!-- .grid_4 -->
            <div class="clear"></div>
        </div>
        <!-- #content_bottom -->
        <div class="clear"></div>
        <div class="clear"></div>
        <div class="carousel" id="following">
            <div class="c_header">
                <div class="grid_10">
                    <h5>Based on your selection, you may be interested in the following item:</h5>
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
                            <img class="sale" src="images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="images/product_1.png" alt="" title=""/></a>
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
                            <img class="sale" src="images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="images/product_2.png" alt="" title=""/></a>
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
                                <a href="product_page.html"><img src="images/product_3.png" alt="" title=""/></a>
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
                            <img class="sale" src="images/sale.png" alt="Sale"/>

                            <div class="prev">
                                <a href="product_page.html"><img src="images/product_4.png" alt="" title=""/></a>
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
                                <a href="product_page.html"><img src="images/product_5.png" alt="" title=""/></a>
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
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>

</html>
