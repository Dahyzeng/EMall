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

    <title>Products comparison</title>

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
    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>

</head>
<body>
<jsp:include page="common/header.jsp"/>
<section id="main" class="entire_width">
    <div class="container_12">
        <div class="grid_12">
            <h1 class="page_title">Compare Products</h1>

            <table class="compare">
                <tr class="close_top">
                    <td class="desc"></td>
                    <td><a title="close" class="close" href="#"></a></td>
                    <td><a title="close" class="close" href="#"></a></td>
                    <td><a title="close" class="close" href="#"></a></td>
                </tr>
                <tr>
                    <th class="desc">Product Name</th>
                    <th class="bg name">Product Name</th>
                    <th class="edit"></th>
                    <th class="bg price">Unit Price</th>
                </tr>
                <tr class="images">
                    <td class="desc">Image</td>
                    <td class="bg"><a href="product_page.html">
                        <div><img src="images/produkt_slid1.png" alt="Product slide 1"></div>
                    </a></td>
                    <td><a href="product_page.html">
                        <div><img src="images/product_6.png" alt="Product 6"></div>
                    </a></td>
                    <td class="bg"><a href="product_page.html">
                        <div><img src="images/product_2.png" alt="Product 2"></div>
                    </a></td>
                </tr>
                <tr class="prise">
                    <td class="desc">Price</td>
                    <td class="bg">$550.00
                        <div class="price_old">$725.00</div>
                    </td>
                    <td>$550.00
                        <div class="price_old">$725.00</div>
                    </td>
                    <td class="bg">$550.00
                        <div class="price_old">$725.00</div>
                    </td>
                </tr>
                <tr class="model">
                    <td class="desc">Model</td>
                    <td class="bg">Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</td>
                    <td>Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</td>
                    <td class="bg">Willert Home Keep it Dry Closet <br/>Moisture Remover Crystal</td>
                </tr>
                <tr class="brand">
                    <td class="desc">Brand</td>
                    <td class="bg">Breeze</td>
                    <td>Breeze</td>
                    <td class="bg">Breeze</td>
                </tr>
                <tr class="availbility">
                    <td class="desc">Availbility</td>
                    <td class="bg">In Stock</td>
                    <td>In Stock</td>
                    <td class="bg">In Stock</td>
                </tr>
                <tr class="rating">
                    <td class="desc">Rating</td>
                    <td class="bg">
                        <div class="quality">
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a href="#"></a>
                            <a href="#"></a>
                        </div>
                    </td>
                    <td>
                        <div class="quality">
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a href="#"></a>
                            <a href="#"></a>
                        </div>
                    </td>
                    <td class="bg">
                        <div class="quality">
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a class="plus" href="#"></a>
                            <a href="#"></a>
                            <a href="#"></a>
                        </div>
                    </td>
                </tr>
                <tr class="description">
                    <td class="desc">Description</td>
                    <td class="bg">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus congue.
                            Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra lectus
                            fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p><br/>

                        <p>Cras ullamcorper nisl non odio congue accumsan. Class aptent taciti sociosqu ad litora
                            torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat.</p>
                    </td>
                    <td>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus congue.
                            Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra lectus
                            fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p><br/>

                        <p>Cras ullamcorper nisl non odio congue accumsan. Class aptent taciti sociosqu ad litora
                            torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat.</p>
                    </td>
                    <td class="bg">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra faucibus congue.
                            Aenean luctus dolor et purus malesuada luctus. Quisque ullamcorper ante viverra lectus
                            fermentum quis rutrum erat sollicitudin. Fusce tortor massa.</p><br/>

                        <p>Cras ullamcorper nisl non odio congue accumsan. Class aptent taciti sociosqu ad litora
                            torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat.</p>
                    </td>
                </tr>
                <tr class="add_cart">
                    <td class="desc"></td>
                    <td class="bg">
                        <button class="add">Add to Cart</button>
                    </td>
                    <td>
                        <button class="add">Add to Cart</button>
                    </td>
                    <td class="bg">
                        <button class="add">Add to Cart</button>
                    </td>
                </tr>
                <tr class="close_botttom">
                    <td class="desc"></td>
                    <td><a title="close" class="close" href="#"></a></td>
                    <td><a title="close" class="close" href="#"></a></td>
                    <td><a title="close" class="close" href="#"></a></td>
                </tr>
            </table>
        </div>
        <!-- .grid_12 -->
    </div>
    <!-- .container_12 -->
</section>
<jsp:include page="common/footer.jsp"/>
</body>
</html>
