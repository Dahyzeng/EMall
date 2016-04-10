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

    <title>404</title>

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
            $('#list_banners').carouFredSel({
                prev: '#ban_prev',
                next: '#ban_next',
                scroll: 1,
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

<section id="main" class="entire_width page-404">
    <div class="container_12">
        <div id="content">

            <div class="grid_4 left_404">
                <h1 class="text_404">404</h1>
                <h6>Page not found...</h6>
            </div>
            <!-- .adress -->

            <div class="grid_8">
                <h2>Whoops, our bad...</h2>

                <p><strong>he page you requested was not found, and we have a fine guess why.</strong></p>
                <ul>
                    <li>If you typed the URL directly, please make sure the spelling is correct.</li>
                    <li>If you clicked on a link to get here, the link is outdated.</li>
                </ul>
                <p><strong>What can you do?</strong><br/>
                    Have no fear, help is near! There are many ways you can get back on track with Magento Store.</p>
                <ul>
                    <li><a href="#">Go back</a> to the previous page.</li>
                    <li>Use the search bar at the top of the page to search for your products.<br/>
                        Follow these links to get you back on track!
                    </li>
                    <li><a href="#">Store Home</a> | <a href="#">My Account</a></li>
                </ul>
            </div>
            <!-- .grid_8 -->
        </div>
        <!-- #content -->

        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
</html>