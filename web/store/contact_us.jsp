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
                <h1 class="page_title">Contact Us</h1>
            </div>

            <div class="grid_4 adress">
                <h3>Address</h3>
                <p>49 Archdale, 2B Charleston, New York City, USA</p>
                <hr>

                <h3>Phones</h3>
                <p>Support: <span>+777 (100) 1234</span><br/>
                    Sales manager: <span>+777 (100) 4321</span><br/>
                    Director: <span>+777 (100) 1243</span></p>
                <hr>

                <h3>Email Addresses</h3>
                <p>Support: <span>support@example.com</span><br/>
                    Sales manager: <span>manager@example.com</span><br/>
                    Director: <span>chief@example.com</span></p>
            </div>

            <div class="grid_8">
                <form class="contact">
                    <h2>Quick Contact</h2>

                    <div class="name">
                        <strong>Name:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="name" data-bind="value: name" />
                    </div>

                    <div class="email">
                        <strong>Email Address: </strong><sup class="surely">*</sup><br/>
                        <input type="email" name="email" data-bind="value: email" />
                    </div>

                    <div class="phone" style="clear: both">
                        <strong>Telephone:</strong><br/>
                        <input type="text" name="phone" data-bind="value: phone" />
                    </div>

                    <div class="comment">
                        <strong>Comment:</strong><sup class="surely">*</sup><br/>
                        <textarea name="comment" id="comment"></textarea>
                    </div>

                    <div class="submit">
                        <div class="field"><sup class="surely">*</sup><span>Required Field</span></div>
                        <input type="submit" value="Submit" data-bind="click: onSubmit" />
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