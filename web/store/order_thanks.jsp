<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="<%request.getContextPath();%>/store/js/jquery-2.1.1.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>

</head>
<body>

<jsp:include page="common/header.jsp"/>

<section id="main" class="entire_width page-404">
    <div class="container_12">
        <div id="content">
            <div class="grid_8">
                <h2>Thanks for your order, our bad...</h2>

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
<script>
    function thanksPage() {
        var self = this;
        (function () {
            headerPage();
        })();
    }
    ko.applyBindings(new thanksPage());
</script>
</html>