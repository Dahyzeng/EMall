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
        <li <c:if test="${requestScope.activeTab eq 'mall'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/info">
                <i class="icon-pencil"></i>
                <span>Mall Info</span>
            </a>
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
        <li <c:if test="${requestScope.activeTab eq 'order'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/order">
                <i class="icon-truck"></i>
                <span>Order</span><div class="badge" style="float: right" id="orderCountBadge"></div>
            </a>
        </li>

        <li <c:if test="${requestScope.activeTab eq 'account'}">class="active" >
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div </c:if>>
            <a href="/merchant/account">
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
