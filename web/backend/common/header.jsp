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
    <audio id="newOrderAudio">
        <source src="<%request.getContextPath();%>/backend/img/newOrder.mp3" type="audio/mpeg"/>
    </audio>
</div>

<script type="text/javascript" src="/dwr/util.js" ></script>
<script type="text/javascript" src="/dwr/engine.js" ></script>
<script type="text/javascript" src="/dwr/interface/promptNewOrder.js" ></script>
<script>
    (function() {
        dwr.engine.setActiveReverseAjax(true);
        dwr.engine.setNotifyServerOnPageUnload(true);
        prompt1();
    })();
    function promptOrder (count) {
        if (count != null) {
            document.getElementById("orderCountBadge").innerHTML = count;
            if (document.getElementById("unconfirmedTabCount")) {
                document.getElementById("unconfirmedTabCount").innerHTML = count;
            }
        }
    }
    function prompt1() {
        promptNewOrder.prompt(function(count) {
            promptOrder(count);
        });
    }
    function prompt(count) {
        promptOrder(count);
        $("#newOrderAudio")[0].play();
    }

</script>
