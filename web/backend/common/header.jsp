<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar navbar-inverse">
    <div class="navbar-inner">
        <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <a class="brand" href="/merchant/home"><img src="<%request.getContextPath();%>/backend/img/logo.png"/></a>

        <ul class="nav pull-right">
            <li class="hidden-phone">
                <input class="search" type="text"/>
            </li>
            <li class="settings hidden-phone">
                <a href="signin.html" role="button">
                    <i class="icon-share-alt"></i>
                </a>
            </li>
        </ul>
    </div>
</div>