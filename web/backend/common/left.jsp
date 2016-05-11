<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li <c:if test="${requestScope.activeTab eq 'home'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/home">
                <i class="icon-home"></i>
                <span>Home</span>
            </a>
        </li>
        <li <c:if test="${requestScope.activeTab eq 'user'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
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

        <li <c:if test="${requestScope.activeTab eq 'category'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/category">
                <i class="icon-sitemap"></i>
                <span>Item Category</span>
            </a>
        </li>

        <li <c:if test="${requestScope.activeTab eq 'product'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/product">
                <i class="icon-leaf"></i>
                <span>Product</span>
            </a>
        </li>

        <li <c:if test="${requestScope.activeTab eq 'leaveMessage'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/message">
                <i class="icon-envelope"></i>
                <span>Leave Message</span>
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

        <li <c:if test="${requestScope.activeTab eq 'log'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/log">
                <i class="icon-book"></i>
                <span>Logs</span>
            </a>
        </li>

    </ul>
</div>
