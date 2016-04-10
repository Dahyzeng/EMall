<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Hidden Page</title>
</head>
<body>
    <jsp:useBean id="merchant" class="emall.entity.Merchant" scope="request"/>
    <form:form action="/admin/add_merchant" method="post" modelAttribute="merchant">
        merchant name:<form:input path="merchantName"/><form:errors path="merchantName"/><br/>
        password:<form:input path="password" type="password"/><form:errors path="password"/><br/>
        email:   <form:input path="email"/><form:errors path="email"/><br/>
        <input type="submit" value="Confirm"/>
    </form:form>
</body>
</html>
