<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li class="active">
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="/merchant/home">
                <i class="icon-home"></i>
                <span>Home</span>
            </a>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-group"></i>
                <span>Users</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="#">User list</a></li>
                <li><a href="#">New user form</a></li>
                <li><a href="#">User profile</a></li>
            </ul>
        </li>

        <li>
            <a href="/merchant/category">
                <i class="icon-sitemap"></i>
                <span>Item Category</span>
            </a>
        </li>

        <li>
            <a href="product.html">
                <i class="icon-leaf"></i>
                <span>Product</span>
            </a>
        </li>
        <li>
            <a href="order.html">
                <i class="icon-truck"></i>
                <span>Order</span>
            </a>
        </li>

        <li>
            <a href="account.html">
                <i class="icon-user"></i>
                <span>Account</span>
            </a>
        </li>

        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-book"></i>
                <span>Logs</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="#">Merchant</a></li>
                <li><a href="#">User</a></li>
            </ul>
        </li>

    </ul>
</div>
