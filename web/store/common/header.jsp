<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
<div class="container_12">
    <header id="branding">
        <div class="grid_3">
            <hgroup>
                <h1 id="site_logo">
                    <a href="/home" title="">
                        <img src="<%request.getContextPath();%>/store/images/logo.png"
                             alt="Online Store Theme Logo"/></a></h1>

                <h2 id="site_description">Online Store Theme</h2>
            </hgroup>
        </div>
        <div class="grid_3">
            <form class="search">
                <input type="text" name="search" class="entry_form" value="" placeholder="Search entire store here..."/>
            </form>
        </div>
        <div class="grid_6">
            <ul id="cart_nav">
                <li>
                    <a class="cart_li" href="#">Cart <span data-bind="text: totalPrice"></span></a>
                    <ul class="cart_cont">
                        <span data-bind="foreach: {data: cartItemArray, as: 'itemMap'}">
                        <li>
                            <a data-bind="attr: {href: '/pdf/' + itemMap.item.itemId}" class="prev_cart">
                                <div class="cart_vert"><img data-bind="attr: {src: itemMap.item.showPicURL}" alt="" title=""/></div>
                            </a>

                            <div class="cont_cart">
                                <h4><span data-bind="text: itemMap.item.itemName"></span></h4>
                                <div class="price"><span data-bind="text: 'x ' + itemMap.quantity + '  $' + itemMap.item.price"></span></div>
                            </div>
                            <a title="close" class="close" href="#"></a>

                            <div class="clear"></div>
                        </li>
                        </span>
                        <li class="no_border">
                            <a href="/cart" class="view_cart">View shopping cart</a>
                            <a href="checkout.html" class="checkout">Procced to Checkout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <nav class="private">
                <ul>
                    <li><a href="#">My Account</a></li>
                    <li class="separator">|</li>
                    <li><a href="#">My Wishlist</a></li>
                    <li class="separator">|</li>
                    <li><a href="/login">Log In</a></li>
                    <li class="separator">|</li>
                    <li><a href="/register">Sign Up</a></li>
                </ul>
            </nav>
        </div>

    </header>

</div>

<div class="clear"></div>
<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li class="curent">
                        <a href="/home">Home</a>
                    </li>
                    <span data-bind="foreach: { data: headerCategories, as: 'category'}">
                        <li>
                            <a data-bind="attr: {href: '/search/grid?fatherId=' + category.categoryId + '&categoryName=' + category.fatherCategoryName }">
                                <span data-bind="text: category.fatherCategoryName"></span>
                            </a>
                            <ul class="sub" data-bind="foreach: { data: category.childCategory, as: 'childCategory'}">
                                <li>
                                    <a data-bind="attr: { href:  '/search/grid?categoryId=' + childCategory.categoryId + '&categoryName=' + childCategory.categoryName }">
                                        <span data-bind="text: childCategory.categoryName"></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </span>
                </ul>
            </nav>
        </div>
    </div>
</div>
</div>
<script>
    function getCartItem() {
        $.get("/cart/getAll", function(resultJson) {
            if (resultJson['success']) {
                self.cartItemArray(resultJson['itemList']);
                self.totalPrice('$'+resultJson['totalPrice']);
            }
        });
    }
    function headerPage() {
        var self = this;
        self.headerCategories = ko.observableArray();
        self.cartItemArray = ko.observableArray();
        self.totalPrice = ko.observableArray();
        (function() {
            $.get("/store/get_categories", function(categoryJson) {
                self.headerCategories(categoryJson);
            });
            getCartItem();
        })();
    }
</script>