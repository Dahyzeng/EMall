<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Shoping cart</title>
    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">
    <script src="<%request.getContextPath();%>/store/js/jquery-1.7.2.min.js"></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js"></script>

</head>

<body>
<jsp:include page="common/header.jsp"/>
<section id="main">
    <div class="container_12">
        <div id="content" class="grid_12">
            <h1 class="page_title">Shopping Cart</h1>
            <table class="cart_product">
                <tr>
                    <th class="images"></th>
                    <th class="bg name">Product Name</th>
                    <th class="bg price">Unit Price</th>
                    <th class="qty">Qty</th>
                    <th class="bg subtotal">Subtotal</th>
                    <th class="close"></th>
                </tr>
                <tbody data-bind="foreach: {data: cartItemArray, as: 'itemMap'}">
                <tr>
                    <td class="images">
                        <a data-bind="attr: {href: '/pdf/' + itemMap.item.itemId}">
                            <img data-bind="attr: {src: itemMap.item.showPicURL}" alt="Product 6">
                        </a>
                    </td>
                    <td class="bg name">
                        <span data-bind="text: itemMap.item.itemName"></span>
                    </td>
                    <td class="bg price">$<span data-bind="text: itemMap.item.price"></span></td>
                    <td class="qty">
                        <input type="text" name="" data-bind="value: itemMap.quantity" placeholder="1000"/>
                    </td>
                    <td class="bg subtotal">$<span data-bind="text: itemMap.item.price * itemMap.quantity"></span></td>
                    <td class="close">
                        <a title="close" class="close" href="#"></a>
                    </td>
                </tr>
                </tbody>
                <tr>
                    <td colspan="7" class="cart_but">
                        <button class="continue"><span>icon</span>Continue Shopping</button>
                        <button class="update"><span>icon</span>Update Shopping Cart</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="cart_but">
                        <span style="float: right" >Total: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span data-bind="text: totalPrice"></span></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</section>
<jsp:include page="common/footer.jsp"/>
</body>
<script>
    function cartPage() {
        var self = this;
        (function() {
            headerPage();
        })();
    }
    ko.applyBindings(new cartPage());
</script>
</html>
