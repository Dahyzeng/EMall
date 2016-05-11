<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Proceed to checkout</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="js/html5.js"></script>
</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width" style="margin-top: 20px">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">Checkout</h1>

                <aside id="community_poll">
                    <h4>Choose Address</h4>
                    <ul style="list-style: none; padding: 0 0 0">
                        <li><input class="niceRadio" type="radio" name="" value=""/> less than 18 years</li>
                        <li><input class="niceRadio" type="radio" name="" value=""/> 18-24 years</li>
                        <li><input class="niceRadio" type="radio" name="" value=""/> 24-30 years(9)</li>
                        <li><input class="niceRadio" type="radio" name="" value=""/> 30-40 years</li>
                        <li><input class="niceRadio" type="radio" name="" value=""/> More than 40 years</li>
                    </ul>
                </aside>

                <div>
                    <h3>Choose Payment</h3>
                </div>
                <div>
                    <h3>Item Detail</h3>
                    <table class="cart_product" style="margin-top: 0px">
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
                                <a href="product_page.html"><img src="images/produkt_slid1.png"
                                                                 alt="Product Slide 1"></a>
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

                    </table>
                    <div style="float: right">
                        <h4>Total Price: $400</h4>
                        <button style="margin-left: 60px">&nbsp Place Order &nbsp</button>
                    </div>
                </div>
            </div>

            <!-- #sidebar_right -->
        </div>
        <!-- #content -->
        <div class="clear"></div>
    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>

</html>

