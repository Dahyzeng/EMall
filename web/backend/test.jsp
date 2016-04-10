<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="<%request.getContextPath();%>/backend/js/jquery-1.7.1.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/knockoutjs.js"></script>
</head>
<body>

    <a href="#" data-bind="click: loginFunction">test</a>
    <script type="text/javascript">
        function test() {
            var self = this;
            self.loginFunction = function () {
                $.get("/test/string_to_object?categoryName=aa&fatherId=33", function(result) {

                })
            }
        }
        ko.applyBindings(new test());
    </script>
</body>
</html>
