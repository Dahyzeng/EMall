<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact us</title>

    <link href="<%request.getContextPath();%>/store/css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="<%request.getContextPath();%>/store/css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="<%request.getContextPath();%>/store/js/jquery-2.1.1.min.js" ></script>
    <script src="<%request.getContextPath();%>/store/js/knockoutjs.js" ></script>

</head>
<body>

<jsp:include page="common/header.jsp"/>

<section id="main" style="margin-top: 40px">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title"><span data-bind="text: headerMessage().contactUs"></span></h1>
            </div>

            <div class="grid_4 adress">
                <h3><span data-bind="text: headerMessage().merchantAddress"></span></h3>
                <p>49 Archdale, 2B Charleston, New York City, USA</p>
                <hr>

                <h3><span data-bind="text: headerMessage().phone"></span></h3>
                <p>
                    <span data-bind="text: headerMessage().support"></span>: <span>+777 (100) 1234</span><br/>
                    <span data-bind="text: headerMessage().saleManager"></span>: <span>+777 (100) 4321</span><br/>
                </p>
                <hr>

                <h3><span data-bind="text: headerMessage().email"></span></h3>
                <p><span data-bind="text: headerMessage().support"></span>: <span>support@example.com</span><br/>
                    <span data-bind="text: headerMessage().saleManager"></span>: <span>manager@example.com</span><br/>
                    </p>
            </div>

            <div class="grid_8">
                <form class="contact">
                    <h2><span data-bind="text: headerMessage().quickContact"></span></h2>

                    <div class="name">
                        <strong><span data-bind="text: headerMessage().name"></span>:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="name" data-bind="value: name" />
                    </div>

                    <div class="email">
                        <strong><span data-bind="text: headerMessage().email"></span>: </strong><sup class="surely">*</sup><br/>
                        <input type="email" name="email" data-bind="value: email" />
                    </div>

                    <div class="phone" style="clear: both">
                        <strong><span data-bind="text: headerMessage().telephone"></span>:</strong><br/>
                        <input type="text" name="phone" data-bind="value: phone" />
                    </div>

                    <div class="comment">
                        <strong><span data-bind="text: headerMessage().comment"></span>:</strong><sup class="surely">*</sup><br/>
                        <textarea name="comment" id="comment"></textarea>
                    </div>

                    <div class="submit">
                        <div class="field"><sup class="surely">*</sup><span><span data-bind="text: headerMessage().requiredField"></span></span></div>
                        <input type="submit" data-bind="click: onSubmit, value: headerMessage().submit" />
                    </div>
                </form>
            </div>
        </div>

        <div class="clear"></div>
    </div>
</section>

<div class="clear"></div>

<jsp:include page="common/footer.jsp"/>

</body>
<script>
    function contactUsPage() {
        var self = this;
        self.name = ko.observable();
        self.email = ko.observable();
        self.phone = ko.observable();
        self.comment = ko.observable();
        self.onSubmit = function () {
            var comment = $("#comment").val();
            $.post("/message/add", {name: self.name(), email: self.email(), telephone: self.phone(), content: comment}, function (json) {
                if (json['success']) {
                    alert("Thank you for the message.");
                    window.location.href = "/home";
                }
            })
        };
        (function () {
           headerPage();
        })();
    }
    ko.applyBindings(new contactUsPage());
</script>
</html>